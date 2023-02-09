import 'package:get/get.dart';

import '../controllers/demo_profile_delete_controller.dart';

class DemoProfileDeleteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DemoProfileDeleteController>(
      () => DemoProfileDeleteController(),
    );
  }
}
