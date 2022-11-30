import 'package:favoritism_communication/app/styles/styles.dart';
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
      textColor = colorTabTextAsEnabled;
      backgroundColor = colorTabBgAsEnabled;
      borderColor = colorTabBorderAsEnabled;
    } else {
      textColor = colorTabTextAsDisabled;
      backgroundColor = colorTabBgAsDisabled;
      borderColor = colorTabBorderAsDisabled;
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
