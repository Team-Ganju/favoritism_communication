import 'package:get/get.dart';

import '../../../repositories/demo_login_repository.dart';
import '../controllers/demo_login_controller.dart';

class DemoLoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DemoLoginController>(
      () => DemoLoginController(),
    );
    Get.lazyPut(
      () => DemoLoginRepository(),
    );
  }
}
