import 'package:favoritism_communication/app/styles/styles.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart' as cb;
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_4.dart';

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
    return cb.ChatBubble(
      clipper: isSender
          ? ChatBubbleClipper4(type: BubbleType.sendBubble)
          : ChatBubbleClipper4(type: BubbleType.receiverBubble),
      backGroundColor: colorChatBubbleBg,
      child: Text(
        text,
        style: const TextStyle(color: colorChatBubbleText, fontSize: 16),
      ),
    );
  }
}
