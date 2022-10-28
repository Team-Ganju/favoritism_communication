import 'package:get/get.dart';

class ChatController extends GetxController {
  final isGroupTalk = false.obs;

  RxBool? flagInversion(flag) {
    flag.value = !flag.value;
    return flag;
  }
}
