import 'package:flutter/material.dart';

class SeachResultListTile extends StatelessWidget {
  const SeachResultListTile({
    super.key,
    required this.text,
    this.onIconButtonPressed,
    this.onTap,
  });

  final String text;
  final VoidCallback? onIconButtonPressed;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconButton(
        icon: const Icon(Icons.close),
        onPressed: onIconButtonPressed,
      ),
      title: Text(
        text,
      ),
      onTap: onTap,
    );
  }
}
