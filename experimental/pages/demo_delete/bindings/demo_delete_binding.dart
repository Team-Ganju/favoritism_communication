import 'package:get/get.dart';

import '../controllers/demo_delete_controller.dart';

class DemoDeleteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DemoDeleteController>(
      () => DemoDeleteController(),
    );
  }
}
