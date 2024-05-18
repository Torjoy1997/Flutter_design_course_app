import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:programming_course/features/chat/bloc/chat_bloc.dart';
import 'package:programming_course/features/chat/model/chat_admin_model.dart';
import 'package:programming_course/features/chat/ui/widget/chat_layout_field.dart';
import 'package:programming_course/features/chat/ui/widget/message_bubble.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({
    super.key,
    required this.userId,
    required this.email,
  });
  final String userId;
  final String email;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<dynamic> chatMessageData = [];

  @override
  void initState() {
    super.initState();
    context.read<ChatBloc>().add(FetchChatMessageEvent(userId: widget.userId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChatBloc, ChatState>(
      listener: (context, state) {
        if (state is ChatMessageLoadedState) {
          chatMessageData = state.chatData;
        }
      },
      child: Scaffold(
        bottomNavigationBar: ChatLayoutField(
          userId: widget.userId,
          email: widget.email,
        ),
        body: BlocBuilder<ChatBloc, ChatState>(
          builder: (context, state) {
            if (state is ChatMessageLoading) {
              const CircularProgressIndicator();
            }
            if (state is ChatMessageLoadedState && chatMessageData.isNotEmpty) {
              return ListView.separated(
                  padding:
                      const EdgeInsets.only(bottom: 40, left: 13, right: 13),
                  reverse: true,
                  itemBuilder: (_, index) {
                    final chatData = chatMessageData[index];
                    if (chatData is AdminChatModel) {
                      return MessageBubble(
                        email: widget.email,
                        adminChatData: chatData,
                      );
                    }
                    return MessageBubble(
                      email: widget.email,
                      chatData: chatData,
                    );
                  },
                  separatorBuilder: (_, __) => const SizedBox(
                        height: 5,
                      ),
                  itemCount: chatMessageData.length);
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
