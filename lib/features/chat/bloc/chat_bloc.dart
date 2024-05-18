import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:programming_course/features/chat/model/chat_admin_model.dart';
import 'package:programming_course/features/chat/model/chat_model.dart';
import 'package:programming_course/features/chat/model/file_model.dart';
import 'package:programming_course/features/chat/repos/chat.dart';
import 'package:programming_course/utils/constants/enums.dart';

import '../../authentication/model/user.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatRepository _chatRepository;
  late StreamSubscription chatStreamSub;

  ChatBloc(this._chatRepository) : super(ChatInitial()) {
    String chatUserId = '';
    if (chatUserId.isNotEmpty) {
      chatStreamSub = _chatRepository.fetchChatData().listen((chatData) {
        add(FetchChatMessageEvent(chatData: chatData));
      });
    }

    on<FetchChatMessageEvent>((event, emit) async {
      try {
        if (event.chatData.isEmpty) {
          emit(ChatMessageLoading());
          if (event.userId != null) {
            chatUserId = event.userId!;
            final chatMessage =
                await _chatRepository.fetchChatMessage(event.userId!);

            for (var chatingData in chatMessage) {
              if (chatingData is ChatModel) {
                if (chatingData.msgType == MessageType.file) {
                  int index = chatMessage.indexWhere((valueElement) =>
                      valueElement.message == chatingData.message);
                  final filePath = await _chatRepository
                      .downloadFile(chatingData.fileData!.name);
                  chatMessage[index] = chatingData.copyWith(
                      fileData:
                          chatingData.fileData!.copyWith(filePath: filePath));
                }
              } else {
                if (chatingData.msgType == MessageType.file) {
                  int index = chatMessage.indexWhere((valueElement) =>
                      valueElement.message == chatingData.message);
                  final filePath = await _chatRepository
                      .downloadFile(chatingData.fileData!.name);
                  chatMessage[index] = chatingData.copyWith(
                      fileData:
                          chatingData.fileData!.copyWith(filePath: filePath));
                }
              }
            }

            final chatFiltering = chatMessage.where((chatData) {
              if (chatData is ChatModel) {
                return chatData.userId == event.userId;
              }
              if (chatData is AdminChatModel) {
                return chatData.recevierUserId == event.userId;
              }
              return false;
            }).toList();

            emit(ChatMessageLoadedState(chatData: chatFiltering));
          }
        } else {
          for (var chatingData in event.chatData) {
            if (chatingData is ChatModel) {
              if (chatingData.msgType == MessageType.file) {
                int index = event.chatData.indexWhere((valueElement) =>
                    valueElement.message == chatingData.message);
                final filePath = await _chatRepository
                    .downloadFile(chatingData.fileData!.name);
                event.chatData[index] = chatingData.copyWith(
                    fileData:
                        chatingData.fileData!.copyWith(filePath: filePath));
              }
            } else {
              if (chatingData.msgType == MessageType.file) {
                int index = event.chatData.indexWhere((valueElement) =>
                    valueElement.message == chatingData.message);
                final filePath = await _chatRepository
                    .downloadFile(chatingData.fileData!.name);
                event.chatData[index] = chatingData.copyWith(
                    fileData:
                        chatingData.fileData!.copyWith(filePath: filePath));
              }
            }
          }
          final chatFiltering = event.chatData.where(
            (chatData) {
              if (chatData is ChatModel) {
                return chatData.userId == chatUserId;
              }
              if (chatData is AdminChatModel) {
                return chatData.recevierUserId == chatUserId;
              }
              return false;
            },
          ).toList();
          emit(ChatMessageLoadedState(chatData: chatFiltering));
        }
      } catch (e) {
        emit(ChatError(errorMessage: e.toString()));
      }
    });

    on<FetchChatUserListEvent>((event, emit) async {
      try {
        final userDataList = await _chatRepository.chatUsers();
        emit(ChatListUserLoaded(userData: userDataList));
      } catch (e) {
        emit(ChatError(errorMessage: e.toString()));
      }
    });

    on<ChatSendEvent>((event, emit) async {
      try {
        if (event.chatData is ChatModel) {
          await _chatRepository.sendMessageByUser(event.chatData);
        } else {
          await _chatRepository
              .sendMessageByAdmin(event.chatData as AdminChatModel);
        }
      } catch (e) {
        emit(ChatError(errorMessage: e.toString()));
      }
    });

    on<ChatSendEventWithImage>((event, emit) async {
      try {
        final image = await ImagePicker().pickImage(
            source: ImageSource.gallery,
            imageQuality: 70,
            maxHeight: 512,
            maxWidth: 512);
        if (image != null) {
          final imageUrl =
              await _chatRepository.uploadImage('Chat/images', image);
          if (event.email == 'islamtarek4@gmail.com') {
            add(ChatSendEvent(
                chatData: AdminChatModel(
                    recevierUserId: event.userId,
                    message: imageUrl,
                    createdBy: DateTime.now(),
                    msgType: MessageType.image)));
          } else {
            add(ChatSendEvent(
                chatData: ChatModel(
                    userId: event.userId,
                    createdBy: DateTime.now(),
                    message: imageUrl,
                    isSendByUser: true,
                    msgType: MessageType.image)));
          }
        }
      } catch (e) {
        emit(ChatError(errorMessage: e.toString()));
      }
    });

    on<ChatSendEventWithDocFile>((event, emit) async {
      try {
        final result = await FilePicker.platform.pickFiles(
            type: FileType.custom, allowedExtensions: ['pdf', 'doc', 'txt']);
        if (result != null) {
          XFile xFile = result.files.first.xFile;
          if (result.files.first.size / (1024 * 1024) > 10) {
            throw 'The File Size is to big';
          }
          final fileUrl =
              await _chatRepository.uploadDocFile('Chat/docFile', xFile);
          // final filePath = await _chatRepository
          //     .downloadFile('Chat/docFile/${result.files.first.name}');

          if (event.email == 'islamtarek4@gmail.com') {
            add(ChatSendEvent(
                chatData: AdminChatModel(
                    recevierUserId: event.userId,
                    message: fileUrl,
                    createdBy: DateTime.now(),
                    msgType: MessageType.file,
                    fileData: FileModel(
                      name: result.files.first.name,
                      size: result.files.first.size / (1024 * 1024),
                      extension: result.files.first.extension ?? '',
                    ))));
          } else {
            add(ChatSendEvent(
                chatData: ChatModel(
                    userId: event.userId,
                    createdBy: DateTime.now(),
                    message: fileUrl,
                    isSendByUser: true,
                    msgType: MessageType.file,
                    fileData: FileModel(
                      name: result.files.first.name,
                      size: result.files.first.size / (1024 * 1024),
                      extension: result.files.first.extension ?? '',
                    ))));
          }
        }
      } catch (e) {
        emit(ChatError(errorMessage: e.toString()));
      }
    });
  }
}
