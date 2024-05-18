// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:intl/intl.dart';

import 'package:programming_course/features/chat/model/file_model.dart';

import '../../../utils/constants/enums.dart';

class AdminChatModel {
  String chatId;
  String recevierUserId;
  String message;
  DateTime createdBy;
  MessageType msgType;
  FileModel? fileData;
  AdminChatModel(
      {this.chatId = '',
      required this.recevierUserId,
      required this.message,
      required this.createdBy,
      this.msgType = MessageType.text,
      this.fileData});

  static AdminChatModel empty() => AdminChatModel(
        recevierUserId: '',
        createdBy: DateTime.now(),
        message: '',
      );

  Map<String, dynamic> toJson() => {
        'recevierUserId': recevierUserId,
        'createdMsg': DateFormat('yyyy-MM-dd hh:mm:ss').format(createdBy),
        'message': message,
        'msgType': msgType.toString(),
        'fileData': fileData?.toJson()
      };
  factory AdminChatModel.fromSnapShot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return AdminChatModel(
          chatId: document.id,
          recevierUserId: data['recevierUserId'],
          createdBy:
              DateFormat('yyyy-MM-dd hh:mm:ss').parse(data['createdMsg']),
          message: data['message'],
          msgType: MessageType.values
              .where((element) => element.toString() == data['msgType'])
              .first,
          fileData: data['fileData'] != null
              ? FileModel.fromJson(data['fileData'])
              : null);
    }
    return AdminChatModel.empty();
  }

  AdminChatModel copyWith({
    String? chatId,
    String? recevierUserId,
    String? message,
    DateTime? createdBy,
    MessageType? msgType,
    FileModel? fileData,
  }) {
    return AdminChatModel(
      chatId: chatId ?? this.chatId,
      recevierUserId: recevierUserId ?? this.recevierUserId,
      message: message ?? this.message,
      createdBy: createdBy ?? this.createdBy,
      msgType: msgType ?? this.msgType,
      fileData: fileData ?? this.fileData,
    );
  }
}
