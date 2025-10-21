import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_generative_ai/google_generative_ai.dart' as gga;

import '../../../../../core/utils/api_keys.dart';

part 'ai_chat_state.dart';


abstract class ChatSessionAdapter {
  List<String> get historyTexts;

  Future<String> sendMessageText(String text);
}

abstract class ChatSessionProvider {
  ChatSessionAdapter create();
}

class DefaultChatSessionProvider implements ChatSessionProvider {
  DefaultChatSessionProvider({gga.GenerativeModel? model}) : _model = model;

  final gga.GenerativeModel? _model;

  @override
  ChatSessionAdapter create() => _GgaAdapter(
    _model ??
        gga.GenerativeModel(
          apiKey: googleGenerativeAiKey,
          model: 'gemini-2.0-flash',
        ),
  );
}

class _GgaAdapter implements ChatSessionAdapter {
  _GgaAdapter(gga.GenerativeModel model) : _session = model.startChat();

  final gga.ChatSession _session;

  @override
  List<String> get historyTexts => _session.history
      .map((c) => c.parts.whereType<gga.TextPart>().map((p) => p.text).join())
      .toList();

  @override
  Future<String> sendMessageText(String text) async {
    final resp = await _session.sendMessage(gga.Content.text(text));
    return resp.text ?? '';
  }
}

class AiChatCubit extends Cubit<AiChatState> {
  AiChatCubit({ChatSessionProvider? sessionProvider})
    : _sessionProvider = sessionProvider ?? DefaultChatSessionProvider(),
      super(AiChatInitial()) {
    _init();
  }

  final ChatSessionProvider _sessionProvider;

  late final ChatSessionAdapter _chatSession;

  Future<void> _init() async {
    _chatSession = _sessionProvider.create();

    // Initialize messages from any existing session history
    final history = _chatSession.historyTexts;
    final messages = history.map((t) => ChatMessage.fromText(t)).toList();
    emit(AiChatLoaded(messages: messages, isTyping: false));
  }

  Future<void> sendMessage(String message) async {
    final trimmed = message.trim();
    if (trimmed.isEmpty) return;

    final current = state is AiChatLoaded
        ? state as AiChatLoaded
        : const AiChatLoaded(messages: [], isTyping: false);

    final userMsg = ChatMessage(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      text: trimmed,
      isFromUser: true,
      createdAt: DateTime.now(),
    );

    final messagesAfterUser = List<ChatMessage>.from(current.messages)
      ..add(userMsg);
    emit(AiChatLoaded(messages: messagesAfterUser, isTyping: true));

    try {
      final text = await _chatSession.sendMessageText(trimmed);

      final botMsg = ChatMessage(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        text: text,
        isFromUser: false,
        createdAt: DateTime.now(),
      );

      final messagesAfterBot = List<ChatMessage>.from(messagesAfterUser)
        ..add(botMsg);
      emit(AiChatLoaded(messages: messagesAfterBot, isTyping: false));
    } catch (e) {
      // Keep existing messages and stop typing on error; surface error string
      emit(
        AiChatLoaded(
          messages: messagesAfterUser,
          isTyping: false,
          error: e.toString(),
        ),
      );
    }
  }

  void clearError() {
    final current = state is AiChatLoaded
        ? state as AiChatLoaded
        : const AiChatLoaded(messages: [], isTyping: false);
    if (current.error != null) {
      emit(
        AiChatLoaded(messages: current.messages, isTyping: current.isTyping),
      );
    }
  }
}
