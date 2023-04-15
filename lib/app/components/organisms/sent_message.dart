import 'package:favoritism_communication/app/components/atoms/atoms.dart';

import 'package:flutter/material.dart';

class SentMessage extends StatelessWidget {
  const SentMessage({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ChatBubble(
          text: text,
          isSender: true,
        ),
        const SizedBox(
          width: 20,
        )
      ],
    );
  }
}
