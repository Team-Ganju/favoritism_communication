import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/demo_app_pages.dart';
import '../controllers/demologin_controller.dart';

class DemologinView extends GetView<DemologinController> {
  const DemologinView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ログイン'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'DemologinView is working',
              style: TextStyle(fontSize: 20),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(DemoRoutes.demoHome);
              },
              child: const Text('メールでログイン'),
            )
          ],
        ),
      ),
    );
  }
}
