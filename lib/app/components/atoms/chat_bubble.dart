import 'package:favoritism_communication/app/styles/styles.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    Key? key,
    required this.text,
    required this.isSender,
  }) : super(key: key);

  final String text;
  final bool isSender;

  @override
  Widget build(BuildContext context) {
    return BubbleSpecialThree(
      text: text,
      isSender: isSender,
      color: colorChatBubbleBg, //TODO: 将来的にdark mode対応予定
      tail: true,
      textStyle: const TextStyle(color: colorChatBubbleText, fontSize: 16),
    );
  }
}
