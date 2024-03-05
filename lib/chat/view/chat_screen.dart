import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/message_model.dart';
import '../view_model/chat_view_model.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Web Socket - Chat'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Theme.of(context).colorScheme.surfaceVariant,
              constraints: const BoxConstraints.expand(),
              child: StreamBuilder<MessageModel>(
                stream: context.read<ChatViewModel>().getMessageStream(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final message = snapshot.requireData;
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          message.message,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          message.dateTime.toIso8601String(),
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: context.read<ChatViewModel>().controller,
                  ),
                ),
                IconButton.filled(
                  icon: const Icon(Icons.send),
                  onPressed:
                      context.read<ChatViewModel>().sendMessageClickEvent,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
