import 'package:get/get.dart';

import '../controllers/demo_profile_update_controller.dart';

class DemoProfileUpdateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DemoProfileUpdateController>(
      () => DemoProfileUpdateController(),
    );
  }
}
