import 'package:flutter/material.dart';

class AlternateCircleChip extends StatelessWidget {
  const AlternateCircleChip({
    super.key,
    required this.isPushed,
    required this.child,
    this.primaryColor = _defaultPrimaryColor,
    this.secondaryColor = _defaultSecondaryColor,
    this.onPressed,
  });

  static const _defaultPrimaryColor = Colors.blueAccent;
  static const _defaultSecondaryColor = Colors.white;

  final Color primaryColor;
  final Color secondaryColor;
  final bool isPushed;
  final VoidCallback? onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    // ボタン押下状態によって、色を反転
    Color foregroundColor = isPushed ? secondaryColor : primaryColor;
    Color backgroundColor = isPushed ? primaryColor : secondaryColor;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: foregroundColor,
        disabledForegroundColor: foregroundColor,
        backgroundColor: backgroundColor,
        disabledBackgroundColor: backgroundColor,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: StadiumBorder(
          side: BorderSide(
            color: primaryColor,
          ),
        ),
        elevation: 0,
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
