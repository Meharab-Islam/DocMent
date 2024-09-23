// lib/feature/chat/domain/chat_controller.dart
import 'package:get/get.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import '../model/chat_model.dart';

class ChatController extends GetxController {
  var messages = <types.Message>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Load demo messages
    _loadDemoMessages();
  }

  void _loadDemoMessages() {
    // Demo messages
    final demoMessages = [
      ChatMessage(
        id: '1',
        text: 'Hello!',
        createdAt: DateTime.now().millisecondsSinceEpoch,
        userId: 'user1',
      ),
      ChatMessage(
        id: '2',
        text: 'Hi there!',
        createdAt: DateTime.now().subtract(Duration(minutes: 1)).millisecondsSinceEpoch,
        userId: 'user2',
      ),
    ];

    messages.value = demoMessages.map((msg) => msg.toMessage()).toList();
  }

  void addMessage(types.Message message) {
    messages.insert(0, message);
  }
}
