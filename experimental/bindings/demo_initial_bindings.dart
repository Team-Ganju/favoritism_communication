import 'package:get/get.dart';

import '../services/demo_auth_service.dart';

class DemoInitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => DemoAuthService(),
    );
  }
}
