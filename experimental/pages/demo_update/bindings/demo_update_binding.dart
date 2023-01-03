import 'package:get/get.dart';

import '../controllers/demo_update_controller.dart';

class DemoUpdateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DemoUpdateController>(
      () => DemoUpdateController(),
    );
  }
}
