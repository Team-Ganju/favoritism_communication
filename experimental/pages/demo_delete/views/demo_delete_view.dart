import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/demo_delete_controller.dart';

class DemoDeleteView extends GetView<DemoDeleteController> {
  const DemoDeleteView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DemoDeleteView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'DemoDeleteView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
