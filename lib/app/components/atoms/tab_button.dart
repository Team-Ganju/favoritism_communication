import 'package:flutter/material.dart';

class TabButton extends StatelessWidget {
  const TabButton({
    super.key,
    required this.chipTitle,
    required this.isEnable,
    required this.onPressed,
  });

  final String chipTitle;
  final bool isEnable;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    Color textColor;
    Color backgroundColor;
    Color borderColor;
    if (isEnable) {
      textColor = Colors.white;
      backgroundColor = Colors.grey;
      borderColor = Colors.grey;
    } else {
      textColor = Colors.black;
      backgroundColor = Colors.white;
      borderColor = const Color.fromARGB(132, 207, 205, 205);
    }
    return RawChip(
      label: Text(chipTitle),
      labelStyle: TextStyle(color: textColor),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      backgroundColor: backgroundColor,
      shape: StadiumBorder(
        side: BorderSide(
          color: borderColor,
        ),
      ),
      onPressed: onPressed,
    );
  }
}
