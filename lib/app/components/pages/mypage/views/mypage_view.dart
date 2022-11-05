import 'package:favoritism_communication/app/components/organisms/nav_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/mypage_controller.dart';

class MypageView extends GetView<MypageController> {
  const MypageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: NavBar(
        backgroundColor: Colors.pinkAccent,
        title: 'プロフィール',
      ),
      body: Center(
        child: Text(
          'MypageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
