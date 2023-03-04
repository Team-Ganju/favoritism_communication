import 'package:flutter/material.dart';

class PickupListItem extends StatelessWidget {
  const PickupListItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text("画像"),
        Text("名前"),
      ],
    );
  }
}
