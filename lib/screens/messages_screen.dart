import 'package:flutter/material.dart';
import 'package:salah/core/app_colors.dart';
import 'package:salah/core/app_localizations.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  final List<MessageItem> messages = [
    MessageItem(
      id: '1',
      agentName: 'Agent Name',
      message: '2 Bedrooms House on sale for...',
      time: '15:03',
      avatar: 'assets/images/Appartment_1.jpg',
      unreadCount: 12,
      hasVideo: false,
    ),
    MessageItem(
      id: '2',
      agentName: 'Agent Name',
      message: '2 Bedrooms House on sale for...',
      time: '15:03',
      avatar: 'assets/images/Modern villa _1.jpeg',
      unreadCount: 0,
      hasVideo: false,
    ),
    MessageItem(
      id: '3',
      agentName: 'Agent Name',
      message: '2 Bedrooms House on sale for...',
      time: '15:03',
      avatar: 'assets/images/Appartment_2.jpg',
      unreadCount: 0,
      hasVideo: false,
    ),
    MessageItem(
      id: '4',
      agentName: 'Agent Name',
      message: '2 Bedrooms House on sale for...',
      time: '15:03',
      avatar: 'assets/images/Modern villa _2.jpeg',
      unreadCount: 0,
      hasVideo: false,
    ),
    MessageItem(
      id: '5',
      agentName: 'Agent Name',
      message: 'Video',
      time: '15:03',
      avatar: 'assets/images/Appartment_3.jpg',
      unreadCount: 0,
      hasVideo: true,
    ),
    MessageItem(
      id: '6',
      agentName: 'Agent Name',
      message: '2 Bedrooms House on sale for...',
      time: '15:03',
      avatar: 'assets/images/Modern villa _3.jpeg',
      unreadCount: 42,
      hasVideo: false,
    ),
    MessageItem(
      id: '7',
      agentName: 'Agent Name',
      message: '2 Bedrooms House on sale for...',
      time: '15:03',
      avatar: 'assets/images/Appartment_4.jpg',
      unreadCount: 0,
      hasVideo: false,
    ),
    MessageItem(
      id: '8',
      agentName: 'Agent Name',
      message: '2 Bedrooms House on sale for...',
      time: '15:03',
      avatar: 'assets/images/Modern villa _4.jpeg',
      unreadCount: 0,
      hasVideo: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: _buildAppBar(context),
      body: _buildMessagesList(),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.backgroundLight,
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: AppColors.textPrimary,
          size: 20,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      title: Text(
        AppLocalizations.of(context)!.messages,
        style: TextStyle(
          color: AppColors.textPrimary,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: Icon(
            Icons.more_vert,
            color: AppColors.textPrimary,
          ),
          onPressed: () {
            // Show options menu
          },
        ),
      ],
    );
  }

  Widget _buildMessagesList() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final message = messages[index];
        return _buildMessageItem(message, index);
      },
    );
  }

  Widget _buildMessageItem(MessageItem message, int index) {
    return Container(
      key: ValueKey('messageItem_${message.id}'),
      margin: const EdgeInsets.only(bottom: 2),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            // Navigate to chat screen
            _openChatScreen(message);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                // Avatar with unread indicator
                _buildAvatar(message),
                const SizedBox(width: 12),
                // Message content
                Expanded(
                  child: _buildMessageContent(message),
                ),
                const SizedBox(width: 8),
                // Time
                _buildTimeStamp(message),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAvatar(MessageItem message) {
    return Stack(
      children: [
        // Avatar image
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: message.unreadCount > 0 ? AppColors.primaryBlue : Colors.transparent,
              width: 2,
            ),
          ),
          child: ClipOval(
            child: Image.asset(
              message.avatar,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 50,
                  height: 50,
                  color: AppColors.grey200,
                  child: Icon(
                    Icons.person,
                    color: AppColors.textSecondary,
                    size: 24,
                  ),
                );
              },
            ),
          ),
        ),
        // Unread count badge
        if (message.unreadCount > 0)
          Positioned(
            top: -2,
            right: -2,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: AppColors.primaryBlue,
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.backgroundLight,
                  width: 2,
                ),
              ),
              constraints: const BoxConstraints(
                minWidth: 20,
                minHeight: 20,
              ),
              child: Text(
                message.unreadCount > 99 ? '99+' : '${message.unreadCount}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildMessageContent(MessageItem message) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Agent name
        Text(
          message.agentName,
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 4),
        // Message preview
        Row(
          children: [
            if (message.hasVideo)
              Container(
                margin: const EdgeInsets.only(right: 6),
                child: Icon(
                  Icons.videocam,
                  color: AppColors.textSecondary,
                  size: 16,
                ),
              ),
            Expanded(
              child: Text(
                message.message,
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTimeStamp(MessageItem message) {
    return Text(
      message.time,
      style: TextStyle(
        color: AppColors.textSecondary,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  void _openChatScreen(MessageItem message) {
    // Navigate to individual chat screen
    // You can implement this later
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Opening chat with ${message.agentName}'),
        backgroundColor: AppColors.primaryBlue,
      ),
    );
  }
}

class MessageItem {
  final String id;
  final String agentName;
  final String message;
  final String time;
  final String avatar;
  final int unreadCount;
  final bool hasVideo;

  MessageItem({
    required this.id,
    required this.agentName,
    required this.message,
    required this.time,
    required this.avatar,
    required this.unreadCount,
    required this.hasVideo,
  });
}