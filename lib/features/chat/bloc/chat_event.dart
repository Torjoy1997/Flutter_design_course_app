part of 'chat_bloc.dart';

sealed class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object> get props => [];
}

class ChatSendEvent extends ChatEvent {
  final dynamic chatData;

  const ChatSendEvent({required this.chatData});
}

class ChatSendEventWithImage extends ChatEvent {
  final String userId;
  final String email;

  const ChatSendEventWithImage({required this.userId, required this.email});
}

class ChatSendEventWithDocFile extends ChatEvent {
  final String userId;
  final String email;

  const ChatSendEventWithDocFile({required this.userId, required this.email});
}

class FetchChatMessageEvent extends ChatEvent {
  final List<dynamic> chatData;
  final String? userId;

  const FetchChatMessageEvent({this.userId, this.chatData = const []});
}

class FetchChatUserListEvent extends ChatEvent {}
