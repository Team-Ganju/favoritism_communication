import 'package:get/get.dart';

import '../controllers/demo_login_controller.dart';

class DemoLoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DemoLoginController>(
      () => DemoLoginController(),
    );
  }
}
