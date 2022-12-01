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
    return isEnable
        ? RawChip(
            label: Text(chipTitle),
            labelStyle: const TextStyle(color: colorTabTextAsEnabled),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            backgroundColor: colorTabBgAsEnabled,
            shape: const StadiumBorder(
              side: BorderSide(
                color: colorTabBorderAsEnabled,
              ),
            ),
            onPressed: onPressed,
          )
        : RawChip(
            label: Text(chipTitle),
            labelStyle: const TextStyle(color: colorTabTextAsDisabled),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            backgroundColor: colorTabBgAsDisabled,
            shape: const StadiumBorder(
              side: BorderSide(
                color: colorTabBorderAsDisabled,
              ),
            ),
            onPressed: onPressed,
          );
  }
}
