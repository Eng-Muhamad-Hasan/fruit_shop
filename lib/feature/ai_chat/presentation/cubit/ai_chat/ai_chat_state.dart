part of 'ai_chat_cubit.dart';

sealed class AiChatState extends Equatable {
  const AiChatState();

  @override
  List<Object?> get props => [];
}

final class AiChatInitial extends AiChatState {}

final class AiChatLoaded extends AiChatState {
  const AiChatLoaded({
    required this.messages,
    required this.isTyping,
    this.error,
  });

  final List<ChatMessage> messages;
  final bool isTyping;
  final String? error;

  @override
  List<Object?> get props => [messages, isTyping, error];
}

/// Lightweight message model used by the cubit and view. Kept here so tests
/// can import a single file for types.
class ChatMessage extends Equatable {
  const ChatMessage({
    required this.id,
    required this.text,
    required this.isFromUser,
    required this.createdAt,
  });

  final String id;
  final String text;
  final bool isFromUser;
  final DateTime createdAt;

  @override
  List<Object?> get props => [id, text, isFromUser, createdAt];

  factory ChatMessage.fromContent(gga.Content content) {
    final String message = content.parts
        .whereType<gga.TextPart>()
        .map<String>((e) => e.text)
        .join('');
    return ChatMessage(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      text: message,
      isFromUser: content.role == 'user',
      createdAt: DateTime.now(),
    );
  }
  factory ChatMessage.fromText(String text, {bool isFromUser = false}) {
    return ChatMessage(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      text: text,
      isFromUser: isFromUser,
      createdAt: DateTime.now(),
    );
  }
}
