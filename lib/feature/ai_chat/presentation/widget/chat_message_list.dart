import 'package:flutter/material.dart';

import '../cubit/ai_chat/ai_chat_cubit.dart';
import 'message_widget.dart';

class ChatMessagesList extends StatefulWidget {
  const ChatMessagesList({
    super.key,
    required ScrollController scrollController,
    required this.messages,
    required this.isTyping,
  }) : _scrollController = scrollController;

  final ScrollController _scrollController;
  final List<ChatMessage> messages;
  final bool isTyping;

  @override
  State<ChatMessagesList> createState() => _ChatMessagesListState();
}

class _ChatMessagesListState extends State<ChatMessagesList> {
  final GlobalKey<AnimatedListState> _animatedListKey =
      GlobalKey<AnimatedListState>();
  late List<ChatMessage> _children;

  @override
  void initState() {
    super.initState();
    _children = List<ChatMessage>.from(widget.messages);
  }

  @override
  void didUpdateWidget(covariant ChatMessagesList oldWidget) {
    super.didUpdateWidget(oldWidget);
    // If new messages were appended, animate insertions at the end.
    if (widget.messages.length > _children.length) {
      final start = _children.length;
      final newItems = widget.messages.sublist(start);
      for (var i = 0; i < newItems.length; i++) {
        final index = start + i;
        _children.insert(index, newItems[i]);
        _animatedListKey.currentState?.insertItem(
          index,
          duration: const Duration(milliseconds: 380),
        );
      }
    } else if (widget.messages.length < _children.length) {
      // If items were removed, perform a simple rebuild to keep in sync.
      _children = List<ChatMessage>.from(widget.messages);
      _animatedListKey.currentState?.setState(() {});
    }
  }

  Widget _buildItem(
    BuildContext context,
    int index,
    Animation<double> animation,
  ) {
    if (widget.isTyping && index == _children.length) {
      return SizeTransition(
        sizeFactor: animation,
        child: const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
            child: Text('...'),
          ),
        ),
      );
    }

    final msg = _children[index];
    final curved = CurvedAnimation(
      parent: animation,
      curve: Curves.easeOutCubic,
    );
    return SizeTransition(
      sizeFactor: curved,
      axisAlignment: msg.isFromUser ? 1.0 : -1.0,
      child: FadeTransition(
        opacity: curved,
        child: RepaintBoundary(
          key: ValueKey<String>('rb_${msg.id}'),
          child: MessageWidget(message: msg.text, isFromUser: msg.isFromUser),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      key: _animatedListKey,
      controller: widget._scrollController,
      initialItemCount: _children.length + (widget.isTyping ? 1 : 0),
      padding: const EdgeInsets.only(bottom: 80),
      itemBuilder: _buildItem,
    );
  }
}
