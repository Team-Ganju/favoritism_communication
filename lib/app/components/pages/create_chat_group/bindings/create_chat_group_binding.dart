import 'package:get/get.dart';

import '../controllers/create_chat_group_controller.dart';

class CreateChatGroupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateChatGroupController>(
      () => CreateChatGroupController(),
    );
  }
}
