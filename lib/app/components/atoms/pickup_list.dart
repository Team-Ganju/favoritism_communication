import 'package:favoritism_communication/app/components/atoms/pickup_list_item.dart';
import 'package:flutter/material.dart';

class PickupList extends StatelessWidget {
  const PickupList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
