import 'package:flutter/material.dart';

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
          color: Color.fromARGB(132, 207, 205, 205),
        ),
      ),
    );
  }
}
