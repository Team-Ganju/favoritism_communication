import 'package:get/get.dart';

class ChatController extends GetxController {
  final RxBool isGroupTalk = false.obs;

  void switchTalkPartner() {
    isGroupTalk.value = !isGroupTalk.value;
  }
}
