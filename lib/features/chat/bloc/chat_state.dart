part of 'chat_bloc.dart';

sealed class ChatState extends Equatable {
  const ChatState();

  @override
  List<Object> get props => [];
}

final class ChatInitial extends ChatState {}

final class ChatMessageLoading extends ChatState {}

final class ChatMessageLoadedState extends ChatState {
  final List<dynamic> chatData;

  const ChatMessageLoadedState({this.chatData = const []});

  @override
  List<Object> get props => [chatData];
}

final class ChatListUserLoading extends ChatState {}

final class ChatListUserLoaded extends ChatState {
  final List<UserModel> userData;

  const ChatListUserLoaded({required this.userData});

  @override
  List<Object> get props => [userData];
}

final class ChatError extends ChatState {
  final String errorMessage;

  const ChatError({required this.errorMessage});
}
