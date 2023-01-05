import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/demo_profile_delete_controller.dart';

class DemoProfileDeleteView extends GetView<DemoProfileDeleteController> {
  const DemoProfileDeleteView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DemoProfileDeleteView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DemoProfileDeleteView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
