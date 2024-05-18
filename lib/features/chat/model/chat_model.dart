import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:intl/intl.dart';

import 'package:programming_course/features/chat/model/file_model.dart';
import 'package:programming_course/utils/constants/enums.dart';

class ChatModel {
  String chatId;
  String userId;
  DateTime createdBy;
  String message;
  bool isSendByUser;
  MessageType msgType;
  FileModel? fileData;

  ChatModel(
      {this.chatId = '',
      required this.userId,
      required this.createdBy,
      required this.message,
      this.isSendByUser = false,
      this.msgType = MessageType.text,
      this.fileData});

  static ChatModel empty() =>
      ChatModel(userId: '', createdBy: DateTime.now(), message: '');

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'createdMsg': DateFormat('yyyy-MM-dd hh:mm:ss').format(createdBy),
        'message': message,
        'isSendByUser': isSendByUser,
        'msgType': msgType.toString(),
        'fileData': fileData?.toJson()
      };
  factory ChatModel.fromSnapShot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return ChatModel(
          chatId: document.id,
          userId: data['userId'],
          createdBy:
              DateFormat('yyyy-MM-dd hh:mm:ss').parse(data['createdMsg']),
          message: data['message'],
          isSendByUser: data['isSendByUser'],
          msgType: MessageType.values
              .where((element) => element.toString() == data['msgType'])
              .first,
          fileData: data['fileData'] != null
              ? FileModel.fromJson(data['fileData'])
              : null);
    }
    return ChatModel.empty();
  }

  ChatModel copyWith({
    String? chatId,
    String? userId,
    DateTime? createdBy,
    String? message,
    bool? isSendByUser,
    MessageType? msgType,
    FileModel? fileData,
  }) {
    return ChatModel(
      chatId: chatId ?? this.chatId,
      userId: userId ?? this.userId,
      createdBy: createdBy ?? this.createdBy,
      message: message ?? this.message,
      isSendByUser: isSendByUser ?? this.isSendByUser,
      msgType: msgType ?? this.msgType,
      fileData: fileData ?? this.fileData,
    );
  }
}
