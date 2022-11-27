import 'package:favoritism_communication/app/components/pages/talk_room/controllers/talk_room_controller.dart';
import 'package:favoritism_communication/app/services/services.dart';
import 'package:get/get.dart';

class TalkRoomBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TalkRoomController>(
      () => TalkRoomController(),
    );
    Get.lazyPut(
      () => ChatService(),
    );
  }
}
