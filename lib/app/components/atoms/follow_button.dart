import 'package:favoritism_communication/app/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FollowButton extends StatelessWidget {
  const FollowButton({
    super.key,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.isFollowed,
    required this.onPressed,
  });

  final Color backgroundColor;
  final Color foregroundColor;
  final bool isFollowed;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(Get.width * 0.3, 25),
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        shape: isFollowed
            ? const StadiumBorder()
            : const StadiumBorder(
                side: BorderSide(
                  color: colorFollowButtonBorderAsUnfollowed,
                ),
              ),
        elevation: 0,
      ),
      onPressed: () {
        onPressed.call();
      },
      child: isFollowed
          ? const Text(
              'フォロー中',
              style: TextStyle(fontSize: 14),
            )
          : const Text(
              'フォローする',
              style: TextStyle(fontSize: 14),
            ),
    );
  }
}
