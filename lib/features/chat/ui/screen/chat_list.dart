import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:programming_course/features/chat/bloc/chat_bloc.dart';

import 'package:programming_course/utils/constants/text_design.dart';

import '../../../authentication/model/user.dart';

class ChatListView extends StatefulWidget {
  const ChatListView({super.key});

  @override
  State<ChatListView> createState() => _ChatListViewState();
}

class _ChatListViewState extends State<ChatListView> {
  List<UserModel> userData = [];
  @override
  void initState() {
    super.initState();
    context.read<ChatBloc>().add(FetchChatUserListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ChatBloc, ChatState>(
        listener: (context, state) {
          if (state is ChatListUserLoaded) {
            userData = state.userData;
          }
        },
        builder: (context, state) {
          if (state is ChatListUserLoading || userData.isEmpty) {
            return Center(
              child: Text(
                'There is No data',
                style: AppCourseTextStyle.kLargeTitleStyle,
              ),
            );
          }
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      context.pushNamed('ChatView',
                          pathParameters: {'id': userData[index].id});
                    },
                    child: Container(
                      height: 120,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade400,
                          borderRadius: BorderRadius.circular(15)),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'asset/images/empty.jpeg',
                              width: 80,
                              height: 80,
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Text(
                            userData[index].fullName,
                            style: AppCourseTextStyle.kHeadlineLabelStyle,
                          )
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                  height: 15,
                ),
                itemCount: userData.length,
              ),
            ),
          );
        },
      ),
    );
  }
}
