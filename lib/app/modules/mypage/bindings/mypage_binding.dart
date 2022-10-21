import 'package:get/get.dart';

import '../controllers/mypage_controller.dart';

class MypageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MypageController>(
      () => MypageController(),
    );
  }
}
