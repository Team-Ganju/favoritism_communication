import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/demo_update_controller.dart';

class DemoUpdateView extends GetView<DemoUpdateController> {
  const DemoUpdateView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DemoUpdateView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DemoUpdateView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
