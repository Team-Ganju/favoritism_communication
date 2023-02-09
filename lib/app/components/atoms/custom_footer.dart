import 'dart:io';
import 'package:favoritism_communication/app/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomFooter extends StatelessWidget {
  const CustomFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: colorFooterBorder,
            width: 1,
          ),
        ),
      ),
      child: Container(
        width: double.infinity,
        height: Platform.isAndroid
            ? Get.height * 0.10
            //下記はPlatform.isIOSでの高さを想定。OSの種類が増えた場合は下記を分岐させる。
            : Get.height * 0.15,
        color: colorFooterBg,
      ),
    );
  }
}
