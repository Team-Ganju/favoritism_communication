import 'package:get/get.dart';

import '../controllers/demo_create_controller.dart';

class DemoCreateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DemoCreateController>(
      () => DemoCreateController(),
    );
  }
}
