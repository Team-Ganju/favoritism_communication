import 'package:favoritism_communication/app/components/atoms/atoms.dart';
import 'package:favoritism_communication/app/styles/styles.dart';
import 'package:flutter/material.dart';

class MessageBar extends StatelessWidget {
  const MessageBar({
    super.key,
    required this.onCameraPressed,
    required this.onPhotoPressed,
    required this.onSendPressed,
  });
  final VoidCallback? onCameraPressed;
  final VoidCallback? onPhotoPressed;
  final VoidCallback? onSendPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.only(
          left: 10,
          top: 10,
          right: 10,
          bottom: 20,
        ),
        width: double.infinity,
        height: 70,
        decoration: const BoxDecoration(
          color: colorMessageBarFg,
          border: Border(
            top: BorderSide(
              color: colorMessageBarBorder,
            ),
          ),
        ),
        child: Row(
          children: [
            IconButton(
              onPressed: onCameraPressed,
              icon: const Icon(
                Icons.camera_alt_outlined,
                size: 32,
              ),
              padding: EdgeInsets.zero,
            ),
            IconButton(
              onPressed: onPhotoPressed,
              icon: const Icon(
                Icons.photo_outlined,
                size: 32,
              ),
              padding: EdgeInsets.zero,
            ),
            const Expanded(
              child: MessageForm(),
            ),
            IconButton(
              onPressed: onSendPressed,
              icon: const Icon(
                Icons.send,
                size: 32,
              ),
              padding: EdgeInsets.zero,
            ),
          ],
        ),
      ),
    );
  }
}
