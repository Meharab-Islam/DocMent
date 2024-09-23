// lib/feature/chat/presentation/chat_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../domain/chat_controller.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

class ChatScreen extends StatelessWidget {
  final String userName;
  final String profilePicture;

  ChatScreen({super.key, required this.userName, required this.profilePicture});
  final ChatController chatController = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage:
                  NetworkImage(profilePicture), // Replace with actual image URL
              radius: 20.0,
            ),
            const SizedBox(width: 10.0),
            Text(userName,
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white)), // Replace with actual name
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              // Implement menu button action
              _showMenu(context);
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Obx(() {
          return Chat(
            messages: chatController.messages.toList(),
            onSendPressed: _handleSendPressed,
            user: types.User(id: 'user1'),
            showUserAvatars: true,
            showUserNames: true,
          );
        }),
      ),
    );
  }

  void _handleSendPressed(types.PartialText message) {
    final newMessage = types.TextMessage(
      id: DateTime.now().toString(),
      text: message.text,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      author: types.User(id: 'user1'),
    );

    chatController.addMessage(newMessage);
  }

  void _showMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                // Implement settings action
              },
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text('Help'),
              onTap: () {
                Navigator.pop(context);
                // Implement help action
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                Navigator.pop(context);
                // Implement logout action
              },
            ),
          ],
        );
      },
    );
  }
}
