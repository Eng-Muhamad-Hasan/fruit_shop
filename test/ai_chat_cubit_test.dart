import 'package:flutter_test/flutter_test.dart';

import 'package:fruit_shop/Feature/ai_chat/presentation/cubit/ai_chat/ai_chat_cubit.dart';

class _FakeAdapter implements ChatSessionAdapter {
  _FakeAdapter({List<String>? initial}) : _history = initial ?? [];

  final List<String> _history;

  @override
  List<String> get historyTexts => _history;

  @override
  Future<String> sendMessageText(String text) async {
    await Future<void>.delayed(const Duration(milliseconds: 5));
    final reply = 'reply to: $text';
    _history.add(reply);
    return reply;
  }
}

class _FakeProvider implements ChatSessionProvider {
  final ChatSessionAdapter adapter;
  _FakeProvider(this.adapter);

  @override
  ChatSessionAdapter create() => adapter;
}

void main() {
  test('AiChatCubit.sendMessage appends user and bot messages', () async {
    final adapter = _FakeAdapter(initial: []);
    final provider = _FakeProvider(adapter);
    final cubit = AiChatCubit(sessionProvider: provider);

    // small delay to allow initialization
    await Future<void>.delayed(const Duration(milliseconds: 20));

    expect(cubit.state, isA<AiChatLoaded>());

    await cubit.sendMessage('hello');
    final state = cubit.state as AiChatLoaded;

    // should have user message + bot message
    expect(state.messages.length, 2);
    expect(state.messages.first.isFromUser, isTrue);
    expect(state.messages.last.isFromUser, isFalse);
  });
}
