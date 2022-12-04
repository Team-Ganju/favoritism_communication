import 'package:get/get.dart';

import '../controllers/demologin_controller.dart';

class DemologinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DemologinController>(
      () => DemologinController(),
    );
  }
}
