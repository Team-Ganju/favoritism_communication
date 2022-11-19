import 'package:get/get.dart';

class MypageController extends GetxController {
  //TODO: Implement MypageController

  final count = 0.obs;
  final userName = "".obs;

  void increment() => count.value++;

  void setUserName(String name) {
    userName(name);
  }

  String getUserName() {
    return userName.value;
  }
}
