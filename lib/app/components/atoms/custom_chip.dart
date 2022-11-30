import 'package:flutter/material.dart';

import '../../styles/app_theme_color.dart';

class CustomChip extends StatelessWidget {
  const CustomChip({
    super.key,
    required this.chipTitle,
    required this.backgroundColor,
  });

  final String chipTitle;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(chipTitle),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      backgroundColor: backgroundColor,
      shape: const StadiumBorder(
        side: BorderSide(
          color: colorChipBorder,
        ),
      ),
    );
  }
}
