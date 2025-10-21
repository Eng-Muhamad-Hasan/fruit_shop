import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_shop/feature/ai_chat/presentation/cubit/ai_chat/ai_chat_cubit.dart';
import 'package:fruit_shop/feature/ai_chat/presentation/widget/ai_chat_view_body.dart';


class AiChatView extends StatefulWidget {
  const AiChatView({super.key});

  @override
  State<AiChatView> createState() => _AiChatViewState();
}

class _AiChatViewState extends State<AiChatView> {
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AiChatCubit(),
      child: const AiChatViewBody()
    
    );
  }

 

}
