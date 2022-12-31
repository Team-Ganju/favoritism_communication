import 'package:get/get.dart';

import '../controllers/demo_user_controller.dart';

class DemoUserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DemoUserController>(
      () => DemoUserController(),
    );
  }
}
