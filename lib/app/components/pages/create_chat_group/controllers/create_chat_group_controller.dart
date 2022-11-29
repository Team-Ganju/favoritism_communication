import 'package:favoritism_communication/app/services/services.dart';
import 'package:get/get.dart';

class CreateChatGroupController extends GetxController {
  RxList searchResult = [].obs;
  final RxBool isMemberSelected = false.obs;
  final RxList<CandidateCardData> candidateMemberCardDataList =
      <CandidateCardData>[].obs;
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

  void selectMember(CandidateMemberCardData candidateMemberData) {
    candidateMemberData[candidateMemberCardDataList
            .indexWhere((element) => element == candidateMemberData)]
        .isSelected = true;
    candidateMemberCardDataList.refresh();
  }

  void unselectMember(CandidateMemberCardData candidateMemberData) {
    candidateMemberData[candidateMemberCardDataList
            .indexWhere((element) => element == candidateMemberData)]
        .isSelected = false;
    candidateMemberCardDataList.refresh();
  }
}
