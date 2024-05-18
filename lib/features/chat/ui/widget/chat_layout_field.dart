import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:iconsax/iconsax.dart';
import 'package:programming_course/features/chat/bloc/chat_bloc.dart';
import 'package:programming_course/features/chat/model/chat_admin_model.dart';
import 'package:programming_course/features/chat/model/chat_model.dart';
import 'package:programming_course/features/chat/repos/chat.dart';

import 'package:programming_course/utils/constants/input_decoration.dart';

class ChatLayoutField extends StatefulWidget {
  const ChatLayoutField({super.key, required this.userId, this.email});
  final String userId;
  final String? email;

  @override
  State<ChatLayoutField> createState() => _ChatLayoutFieldState();
}

class _ChatLayoutFieldState extends State<ChatLayoutField> {
  @override
  Widget build(BuildContext context) {
    final editController = context.read<ChatRepository>();
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        padding: const EdgeInsets.all(12),
        color: Colors.black.withOpacity(0.5),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                context.read<ChatBloc>().add(ChatSendEventWithImage(
                    email: widget.email ?? '', userId: widget.userId));
              },
              child: const Icon(
                Iconsax.gallery_add,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: () {
                context.read<ChatBloc>().add(ChatSendEventWithDocFile(
                    email: widget.email ?? '', userId: widget.userId));
              },
              child: const Icon(
                Icons.text_snippet_rounded,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: TextField(
                controller: editController.message,
                minLines: 1,
                maxLines: 3,
                textCapitalization: TextCapitalization.sentences,
                autocorrect: true,
                enableSuggestions: true,
                decoration: AppInputDesign.kOutlineDesign.copyWith(
                  hintText: 'Aa',
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: () {
                if (widget.email != null) {
                  if (widget.email == 'islamtarek4@gmail.com') {
                    context.read<ChatBloc>().add(ChatSendEvent(
                        chatData: AdminChatModel(
                            recevierUserId: widget.userId,
                            message: editController.message.text,
                            createdBy: DateTime.now())));
                  } else {
                    context.read<ChatBloc>().add(ChatSendEvent(
                        chatData: ChatModel(
                            userId: widget.userId,
                            createdBy: DateTime.now(),
                            message: editController.message.text,
                            isSendByUser: true)));
                  }
                }
              },
              child: const Icon(
                Icons.send_sharp,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
