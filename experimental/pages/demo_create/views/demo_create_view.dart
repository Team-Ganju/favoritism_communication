import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/demo_create_controller.dart';

class DemoCreateView extends GetView<DemoCreateController> {
  const DemoCreateView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DemoCreateView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DemoCreateView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
