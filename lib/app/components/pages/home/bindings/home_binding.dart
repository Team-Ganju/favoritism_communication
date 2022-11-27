import 'package:favoritism_communication/app/services/services.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut(
      () => TabService(),
    );
    Get.lazyPut(
      () => ChatService(),
    );
  }
}
