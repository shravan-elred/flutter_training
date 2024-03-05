import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../model/message_model.dart';

class ChatViewModel extends ChangeNotifier {
  final WebSocketChannel channel = IOWebSocketChannel.connect(
    'ws://echo.websocket.org',
  );

  Stream<MessageModel> getMessageStream() {
    return channel.stream.map(
      (event) => MessageModel.fromJson(event),
    );
  }

  final controller = TextEditingController(text: 'Hello world!');

  void sendMessageClickEvent() {
    final message = MessageModel(
      message: controller.text,
      dateTime: DateTime.now(),
    );
    channel.sink.add(message.toJson());
    controller.clear();
  }

  @override
  void dispose() {
    channel.sink.close();
    controller.dispose();
    super.dispose();
  }
}
