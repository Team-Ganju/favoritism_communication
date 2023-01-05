import 'package:get/get.dart';

import '../controllers/demo_profile_controller.dart';

class DemoProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DemoProfileController>(
      () => DemoProfileController(),
    );
  }
}
