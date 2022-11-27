import 'package:get/get.dart';

class TabService extends GetxService {
  RxInt tabIndex = 0.obs;

  void changeIndex(int index) {
    tabIndex.value = index;
  }
}
