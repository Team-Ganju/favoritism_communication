import 'package:get/get.dart';

import '../controllers/demo_home_controller.dart';

class DemoHomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DemoHomeController>(
      () => DemoHomeController(),
    );
  }
}
