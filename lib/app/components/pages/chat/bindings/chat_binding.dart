import 'package:favoritism_communication/app/components/pages/chat/providers/talk_member_card_model_provider.dart';
import 'package:get/get.dart';

import '../controllers/chat_controller.dart';

class ChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatController>(
      () => ChatController(),
    );
    Get.lazyPut(
      () => TalkMemberCardModelProvider(),
    );
  }
}
