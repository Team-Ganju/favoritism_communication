import 'package:favoritism_communication/app/components/atoms/atoms.dart';
import 'package:favoritism_communication/app/styles/styles.dart';

import 'package:flutter/material.dart';

class ReceivedMessage extends StatelessWidget {
  const ReceivedMessage({
    super.key,
    required this.text,
    required this.profileImage,
  });

  final String text;
  final String? profileImage;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 10,
        ),
        CircleAvatar(
          //TODO:firebase接続後に動作確認
          //profileImageがあればその画像を表示、なければグレー背景でpersonアイコンを表示
          foregroundImage: NetworkImage(
            profileImage ?? '',
          ),
          backgroundColor: colorChatMemberCardCircleBg,
          child: const Icon(
            Icons.person,
            color: colorChatMemberCardIcon,
          ),
        ),
        ChatBubble(
          text: text,
          isSender: false,
        ),
      ],
    );
  }
}
