import 'package:flutter/material.dart';

class SeachedResultListTile extends StatelessWidget {
  const SeachedResultListTile({
    super.key,
    required this.index,
    required this.text,
  });

  final int index;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconButton(
        icon: Icon(Icons.cancel),
        onPressed: () {},
      ),
      title: Text(
        text,
      ),
    );
  }

  void deleteTile(List list, int index) {}
}
