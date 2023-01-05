import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/demo_profile_update_controller.dart';

class DemoProfileUpdateView extends GetView<DemoProfileUpdateController> {
  const DemoProfileUpdateView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DemoProfileUpdateView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DemoProfileUpdateView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
