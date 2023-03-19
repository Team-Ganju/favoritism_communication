import 'package:favoritism_communication/app/components/pages/chat_room/controllers/chat_room_controller.dart';
import 'package:favoritism_communication/app/services/services.dart';
import 'package:get/get.dart';

class ChatRoomBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatRoomController>(
      () => ChatRoomController(),
    );
    Get.lazyPut(
      () => AuthService(),
    );
    Get.lazyPut(
      () => ChatService(),
    );
  }
}
