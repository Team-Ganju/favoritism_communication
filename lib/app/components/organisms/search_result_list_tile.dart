import 'package:flutter/material.dart';

class SeachResultListTile extends StatelessWidget {
  const SeachResultListTile({
    super.key,
    required this.index,
    required this.text,
    this.onPressed,
    this.onTap,
  });

  final int index;
  final String text;
  final VoidCallback? onPressed;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconButton(
        icon: const Icon(Icons.close),
        onPressed: onPressed,
      ),
      title: Text(
        text,
      ),
      //TODO: メンバー選択処理実装
      onTap: onTap,
    );
  }
}
