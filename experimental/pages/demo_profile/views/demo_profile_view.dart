import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/demo_profile_controller.dart';

class DemoProfileView extends GetView<DemoProfileController> {
  const DemoProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DemoProfileView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'DemoProfileView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
