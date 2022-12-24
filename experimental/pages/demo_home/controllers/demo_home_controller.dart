import 'package:get/get.dart';

import '../../../services/demo_auth_service.dart';

class DemoHomeController extends AppControllerBase {}

class AppControllerBase extends GetxController {
  final DemoAuthService authService = Get.find();
}
