import 'package:favoritism_communication/app/services/services.dart';
import 'package:get/get.dart';

class CreateChatGroupController extends GetxController {
  RxList searchResult = [].obs;
  final RxBool isMemberSelected = false.obs;
  final SearchService searchService = Get.find();

  @override
  void onInit() {
    searchService.getTargetUsers();
    super.onInit();
  }

  void searchUser(String searchTarget) {
    searchService.waitInputAndSearch(searchTarget);
    searchResult.value = searchService.results;
  }
}
