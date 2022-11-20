import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // todo 仮としてユーザ名を取得。本来はIDが必要
    controller.userName(Get.arguments[0]);
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProfileView'),
        centerTitle: true,
      ),
      body: Center(
        child: Obx(() => Text(
              '${controller.userName.value}\'s ProfileView is working',
              style: const TextStyle(fontSize: 20),
            )),
      ),
    );
  }
}
