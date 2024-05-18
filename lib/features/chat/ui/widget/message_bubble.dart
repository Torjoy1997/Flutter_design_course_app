import 'package:flutter/material.dart';

import 'package:programming_course/features/chat/model/chat_admin_model.dart';
import 'package:programming_course/features/chat/model/chat_model.dart';
import 'package:programming_course/features/chat/model/file_model.dart';

import 'package:programming_course/features/chat/ui/widget/chat_bubble_layout.dart';
import 'package:programming_course/utils/constants/enums.dart';

import '../../../../core/layouts/image_layout.dart';
import 'file_chat_layout.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble(
      {super.key, this.adminChatData, this.chatData, required this.email});

  final AdminChatModel? adminChatData;
  final ChatModel? chatData;
  final String email;
  get chatDataMain {
    return adminChatData ?? chatData;
  }

  bool get isAdmin {
    return chatDataMain is AdminChatModel ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    if (email == 'islamtarek4@gmail.com') {
      if (chatDataMain.msgType == MessageType.image) {
        return ChatBubbleLayout(
          child: RoundedImageLayout(
            imageUrl: chatDataMain.message,
            isNetworkImage: true,
            height: 250,
            fit: BoxFit.cover,
          ),
        );
      } else if (chatDataMain.msgType == MessageType.file) {
        return ChatBubbleLayout(
            child: FileContainerBox(
          fileDataInfo: chatDataMain.fileData as FileModel,
        ));
      } else {
        return ChatBubbleLayout(
          color: chatDataMain is ChatModel
              ? const Color(0xFFE8E8EE)
              : const Color(0xFF1B97F3),
          isSender: chatDataMain is ChatModel ? false : true,
          child: Text(
            chatDataMain.message,
            style: TextStyle(
                fontSize: 16,
                color: chatDataMain is ChatModel ? Colors.black : Colors.white),
            textAlign: TextAlign.center,
          ),
        );
      }
    }
    if (email != "islamtarek4@gmail.com" &&
        chatDataMain.msgType == MessageType.image) {
      return ChatBubbleLayout(
        isSender: isAdmin ? false : true,
        child: RoundedImageLayout(
          imageUrl: chatDataMain.message,
          isNetworkImage: true,
          height: 250,
          fit: BoxFit.cover,
        ),
      );
    }
    if (email != "islamtarek4@gmail.com" &&
        chatDataMain.msgType == MessageType.file) {
      return ChatBubbleLayout(
        isSender: isAdmin ? false : true,
        child: FileContainerBox(
          fileDataInfo: chatDataMain.fileData as FileModel,
        ),
      );
    }
    return ChatBubbleLayout(
      color: isAdmin ? const Color(0xFFE8E8EE) : const Color(0xFF1B97F3),
      isSender: isAdmin ? false : true,
      child: Text(
        chatDataMain.message,
        style: TextStyle(
            fontSize: 16, color: isAdmin ? Colors.black : Colors.white),
        textAlign: TextAlign.center,
      ),
    );
  }
}
