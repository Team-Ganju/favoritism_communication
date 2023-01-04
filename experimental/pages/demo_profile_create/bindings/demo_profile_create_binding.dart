import 'package:get/get.dart';

import '../controllers/demo_profile_create_controller.dart';

class DemoProfileCreateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DemoProfileCreateController>(
      () => DemoProfileCreateController(),
    );
  }
}
