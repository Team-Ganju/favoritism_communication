import 'package:get/get.dart';

import '../controllers/talk_room_controller.dart';

class TalkRoomBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TalkRoomController>(
      () => TalkRoomController(),
    );
  }
}
