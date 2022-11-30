import 'package:favoritism_communication/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../styles/app_theme_color.dart';

class DialogUtils {
  static Future dialog(VoidCallback action, String userName) {
    return Get.defaultDialog(
      title: "",
      middleText: "",
      content: Column(
        children: [
          Assets.images.matchingImage.image(),
          Text(
            "$userNameさんとマッチングしました。",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const Text(
            "メッセージを送って\n楽しく会話しましょう",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
      actions: [
        FractionallySizedBox(
          widthFactor: 0.8,
          child: TextButton(
            style: TextButton.styleFrom(
                backgroundColor: colorMatchingDialogButtonTextBg),
            onPressed: () {
              action.call();
            },
            child: const Text(
              "トークに移動する",
              style: TextStyle(color: colorMatchingDialogButtonTextFg),
            ),
          ),
        ),
        const SizedBox(height: 90)
      ],
      radius: 80,
    );
  }
}
