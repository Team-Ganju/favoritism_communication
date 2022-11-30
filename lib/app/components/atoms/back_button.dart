import 'package:favoritism_communication/app/styles/styles.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class BackButton extends StatelessWidget {
  const BackButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.arrow_back_ios_new,
      ),
      onPressed: () => Get.back<dynamic>(),
      color: colorIcon,
      iconSize: 30,
    );
  }
}
