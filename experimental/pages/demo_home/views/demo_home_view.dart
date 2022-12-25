import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/demo_home_controller.dart';

class DemoHomeView extends GetView<DemoHomeController> {
  const DemoHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: Align(
          alignment: Alignment.topCenter,
          child: Text(
              'ユーザID:${controller.authService.uid.val}'), //TODO: ログインユーザーのIDを表示
        ),
      ),
    );
  }
}
