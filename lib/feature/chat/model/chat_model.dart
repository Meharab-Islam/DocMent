// lib/feature/chat/model/chat_model.dart
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

class ChatMessage {
  final String id;
  final String text;
  final int createdAt;
  final String userId;

  ChatMessage({
    required this.id,
    required this.text,
    required this.createdAt,
    required this.userId,
  });

  types.Message toMessage() {
    return types.TextMessage(
      id: id,
      text: text,
      createdAt: createdAt,
      author: types.User(id: userId),
    );
  }
}
