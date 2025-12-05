import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_shop/core/functions/show_log_snack_bar.dart';
import 'package:fruit_shop/core/shared/custom_appbar_widget.dart';
import 'package:fruit_shop/generated/l10n.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../cubit/ai_chat/ai_chat_cubit.dart';
import 'chat_message_list.dart';

class AiChatViewBody extends StatefulWidget {
  const AiChatViewBody({super.key});

  @override
  State<AiChatViewBody>  createState() => _AiChatViewBodyState();
}

class _AiChatViewBodyState extends State<AiChatViewBody> {
  final FocusNode focusNode = FocusNode();
  late TextEditingController textEditingController;
  final ScrollController _scrollController = ScrollController();

  AiChatCubit get _cubit => context.read<AiChatCubit>();

  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AiChatCubit, AiChatState>(
      listener: (context, state) {
        if (state is AiChatLoaded) _scrollToEnd();
        if (state is AiChatLoaded && state.error != null) {
          showLogSnackBar(context, state.error.toString());
        }
      },
      builder: (context, state) {
        if (state is! AiChatLoaded) {
          return const Center(child: CircularProgressIndicator());
        }

        final messages = state.messages;
        final isTyping = state.isTyping;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              buildAppBar(
                context,
                title: S.of(context).ai_chat_title,
                backButton: false,
              ),
              const SizedBox(height: 16),
              Expanded(
                child: Stack(
                  children: [
                    ChatMessagesList(
                      scrollController: _scrollController,
                      messages: messages,
                      isTyping: isTyping,
                    ),

                    Positioned(
                      bottom: 16,
                      left: 0,
                      right: 0,
                      child: BlocBuilder<AiChatCubit, AiChatState>(
                        builder: (context, state) {
                          final isTyping = state is AiChatLoaded
                              ? state.isTyping
                              : false;
                          return Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: textEditingController,
                                  focusNode: focusNode,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: S.of(context).ai_chat_hint,
                                    hintStyle: const TextStyle(
                                      color: AppColors.gray500,
                                    ),
                                    border: buildChatFieldBorder(),
                                    enabledBorder: buildChatFieldBorder(),
                                    focusedBorder: buildChatFieldBorder(),
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 12,
                                    ),
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.only(
                                        left: 8.0,
                                        right: 8.0,
                                      ),
                                      child: SvgPicture.asset(
                                        Assets.imagesThemeOption,
                                        fit: BoxFit.scaleDown,
                                        colorFilter: const ColorFilter.mode(
                                          Color(0xFF1B5E37),
                                          BlendMode.srcIn,
                                        ),
                                      ),
                                    ),
                                  ),
                                  onSubmitted: (_) => _onSendPressed(),
                                ),
                              ),
                              const SizedBox(width: 8),
                              isTyping
                                  ? const Padding(
                                      padding: EdgeInsets.all(12.0),
                                      child: SizedBox(
                                        width: 18,
                                        height: 18,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                AppColors.orange500,
                                              ),
                                        ),
                                      ),
                                    )
                                  : GestureDetector(
                                      onTap: isTyping ? null : _onSendPressed,
                                      child: CircleAvatar(
                                        backgroundColor: AppColors.green100,
                                        child: SvgPicture.asset(
                                          Assets.imagesMessageGreen,
                                        ),
                                      ),
                                    ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _onSendPressed() {
    final text = textEditingController.text;
    if (text.trim().isEmpty) return;
    _cubit.sendMessage(text);
    textEditingController.clear();
    focusNode.requestFocus();
  }

  void _scrollToEnd() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_scrollController.hasClients) return;
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
      );
    });
  }

  OutlineInputBorder buildChatFieldBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        color: AppColors.lighterPrimaryColor,
        width: 1,
      ),
    );
  }
}
