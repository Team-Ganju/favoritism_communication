import 'package:favoritism_communication/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            style:
                TextButton.styleFrom(backgroundColor: const Color(0xff0091ea)),
            onPressed: () {
              action.call();
            },
            child: const Text(
              "トークに移動する",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 90)
      ],
      radius: 80,
    );
  }
}
