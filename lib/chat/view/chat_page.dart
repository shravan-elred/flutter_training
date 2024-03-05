import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/chat_view_model.dart';
import 'chat_screen.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ChatViewModel(),
      child: const ChatScreen(),
    );
  }
}
