import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/demo_user_controller.dart';

class DemoUserCreateView extends GetView<DemoUserController> {
  const DemoUserCreateView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(controller.authService.uid.val),
    );
  }
}
