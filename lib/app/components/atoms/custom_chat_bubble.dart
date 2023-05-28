import 'package:favoritism_communication/app/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';

class CustomChatBubble extends StatelessWidget {
  const CustomChatBubble({
    Key? key,
    required this.text,
    required this.isSender,
  }) : super(key: key);

  final String text;
  final bool isSender;

  @override
  Widget build(BuildContext context) {
    return ChatBubble(
      clipper: isSender
          ? ChatBubbleClipper1(type: BubbleType.sendBubble)
          : ChatBubbleClipper1(type: BubbleType.receiverBubble),
      backGroundColor: colorChatBubbleBg,
      child: Container(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
        child: Text(
          text,
          style: const TextStyle(color: colorChatBubbleText, fontSize: 16),
        ),
      ),
    );
  }
}
