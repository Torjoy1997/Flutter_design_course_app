import 'package:flutter/material.dart';

class ChatBubbleLayout extends StatelessWidget {
  const ChatBubbleLayout(
      {super.key, this.isSender = true, required this.child, this.color});
  final Color? color;
  final bool isSender;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSender ? Alignment.topRight : Alignment.topLeft,
      child: FractionallySizedBox(
        widthFactor: 0.7,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  color: color,
                  boxShadow: const [
                    BoxShadow(
                        color: Color(0xFF5E636B),
                        offset: Offset(0, 5),
                        blurRadius: 4)
                  ],
                  borderRadius: BorderRadius.circular(16)),
              child: child),
        ),
      ),
    );
  }
}
