import 'package:favoritism_communication/app/services/services.dart';
import 'package:get/get.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PreferenceService());
  }
}
