import 'package:flutter/material.dart';

class PickupListItem extends StatelessWidget {
  const PickupListItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text("画像"),
        Text("名前"),
      ],
    );
  }
}
