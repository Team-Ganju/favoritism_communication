import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/demo_profile_create_controller.dart';

class DemoProfileCreateView extends GetView<DemoProfileCreateController> {
  const DemoProfileCreateView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DemoProfileCreateView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DemoProfileCreateView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
