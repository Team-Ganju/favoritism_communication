import 'package:flutter/material.dart';

class CustomActionChip extends StatelessWidget {
  const CustomActionChip({
    Key? key,
    required this.label,
    this.labelPadding,
    this.avatar,
    this.side,
    this.backgroundColor,
    this.padding,
    this.onPressed,
  }) : super(key: key);

  final Widget label;
  final EdgeInsetsGeometry? labelPadding;
  final Widget? avatar;
  final BorderSide? side;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      avatar: avatar,
      label: label,
      labelPadding: labelPadding,
      side: side,
      backgroundColor: backgroundColor,
      padding: padding,
      onPressed: onPressed,
    );
  }
}
