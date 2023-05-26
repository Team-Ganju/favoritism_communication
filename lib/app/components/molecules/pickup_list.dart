import 'package:favoritism_communication/app/components/atoms/atoms.dart';
import 'package:flutter/material.dart';

class PickupList extends StatelessWidget {
  const PickupList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text("ピックアップタイトルピックアップタイトルピックアップタイトル"),
        Row(
          children: [
            PickupListItem(),
            PickupListItem(),
            PickupListItem(),
            PickupListItem(),
            PickupListItem(),
          ],
        )
      ],
    );
  }
}
