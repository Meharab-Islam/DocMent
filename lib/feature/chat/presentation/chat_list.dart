// lib/feature/chat/presentation/chat_list_screen.dart
import 'package:docment/feature/chat/presentation/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ChatListScreen extends StatelessWidget {
  final List<ChatItem> chatItems = [
    ChatItem(
        name: 'John Doe',
        lastMessage: 'Hey there!',
        time: '2:30 PM',
        avatarUrl:
            'https://images.pexels.com/photos/1040880/pexels-photo-1040880.jpeg?auto=compress&cs=tinysrgb&w=600'),
    ChatItem(
        name: 'Jane Smith',
        lastMessage: 'How are you?',
        time: '1:45 PM',
        avatarUrl:
            'https://images.pexels.com/photos/2379004/pexels-photo-2379004.jpeg?auto=compress&cs=tinysrgb&w=600'),
    // Add more chat items here
  ];

  final List<ActiveUser> activeUsers = [
    ActiveUser(
        name: 'Alice',
        avatarUrl:
            'https://images.pexels.com/photos/678783/pexels-photo-678783.jpeg?auto=compress&cs=tinysrgb&w=600'),
    ActiveUser(
        name: 'Bob',
        avatarUrl:
            'https://images.pexels.com/photos/1819483/pexels-photo-1819483.jpeg?auto=compress&cs=tinysrgb&w=600'),
    // Add more active users here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: const Text('Chats',
            style: TextStyle(fontSize: 20.0, color: Colors.white)),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          _buildActiveUsersSection(),
          Expanded(
            child: ListView.builder(
              itemCount: chatItems.length,
              itemBuilder: (context, index) {
                final chatItem = chatItems[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(chatItem.avatarUrl),
                  ),
                  title: Text(chatItem.name,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(chatItem.lastMessage),
                  trailing:
                      Text(chatItem.time, style: TextStyle(color: Colors.grey)),
                  onTap: () {
                    // Navigate to chat screen
                    Get.to(() => ChatScreen(
                          userName: chatItem.name,
                          profilePicture: chatItem.avatarUrl,
                        ));
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActiveUsersSection() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Active Now',
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.0),
          SizedBox(
            height: 80.h, // Adjust height if needed
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: activeUsers.length,
              itemBuilder: (context, index) {
                final activeUser = activeUsers[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(activeUser.avatarUrl),
                        radius: 30.r, // Adjust radius if needed
                      ),
                      SizedBox(height: 4.0),
                      Text(
                        activeUser.name,
                        style: TextStyle(fontSize: 12.sp),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ChatItem {
  final String name;
  final String lastMessage;
  final String time;
  final String avatarUrl;

  ChatItem({
    required this.name,
    required this.lastMessage,
    required this.time,
    required this.avatarUrl,
  });
}

class ActiveUser {
  final String name;
  final String avatarUrl;

  ActiveUser({
    required this.name,
    required this.avatarUrl,
  });
}
