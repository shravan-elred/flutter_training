import 'dart:convert';

class MessageModel {
  const MessageModel({
    required this.message,
    required this.dateTime,
  });

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      message: map['message'] as String,
      dateTime: DateTime.fromMillisecondsSinceEpoch(map['dateTime'] as int),
    );
  }

  factory MessageModel.fromJson(String source) =>
      MessageModel.fromMap(json.decode(source) as Map<String, dynamic>);

  final String message;
  final DateTime dateTime;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
      'dateTime': dateTime.millisecondsSinceEpoch,
    };
  }

  String toJson() => json.encode(toMap());
}
