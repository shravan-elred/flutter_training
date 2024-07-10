import 'package:flutter/material.dart';

import 'timestamped_chat_message.dart';

class ChatMessageExampleScreen extends StatefulWidget {
  const ChatMessageExampleScreen({super.key});

  @override
  State<ChatMessageExampleScreen> createState() =>
      _ChatMessageExampleScreenState();
}

class _ChatMessageExampleScreenState extends State<ChatMessageExampleScreen> {
  final messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat message example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              width: 220,
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  color: Colors.blue.shade200,
                  padding: const EdgeInsets.all(16),
                  child: ListenableBuilder(
                    listenable: messageController,
                    builder: (context, child) => TimestampedChatMessage(
                      text: '',
                      textStyle: Theme.of(context).textTheme.bodyMedium ??
                          const TextStyle(),
                      sentAt: DateTime.now().toIso8601String(),
                      sentAtTextStyle: Theme.of(context).textTheme.bodySmall ??
                          const TextStyle(),
                    ),
                  ),
                ),
              ),
            ),
            TextField(
              controller: messageController,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }
}
