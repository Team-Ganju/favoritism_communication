import 'package:favoritism_communication/app/services/services.dart';
import 'package:favoritism_communication/app/components/organisms/organisms.dart';
import 'package:favoritism_communication/app/dummy_data/candidate_member_card_dummy_data.dart';
import 'package:get/get.dart';

class CreateChatGroupController extends GetxController {
  RxList searchResult = [].obs;
  final RxBool isSelectedAtLeastOne = false.obs;
  final RxList<CandidateMemberCardData> candidateMemberCardDataList =
      <CandidateMemberCardData>[].obs;
  final SearchService searchService = Get.find();

  @override
  void onInit() {
    searchService.getTargetUsers();
    fetchMutualFollowUserData();
    super.onInit();
  }

  /// TODO: firebase構築後、相互フォローとなっているユーザーリストの検索処理を書く
  void fetchMutualFollowUserData() {
    candidateMemberCardDataList.assignAll(candidateMemberCardList);
    candidateMemberCardDataList.refresh();
  }

  void searchUser(String searchTarget) {
    searchService.waitInputAndSearch(searchTarget);
    searchResult.value = searchService.results;
  }

  void select(CandidateMemberCardData candidateMemberCardData) {
    candidateMemberCardDataList[candidateMemberCardDataList
            .indexWhere((element) => element == candidateMemberCardData)]
        .isSelected = true;
    //FIXME:
    print(candidateMemberCardDataList[candidateMemberCardDataList
            .indexWhere((element) => element == candidateMemberCardData)]
        .isSelected);
    candidateMemberCardDataList.refresh();
  }

  void unselect(CandidateMemberCardData candidateMemberCardData) {
    candidateMemberCardDataList[candidateMemberCardDataList
            .indexWhere((element) => element == candidateMemberCardData)]
        .isSelected = false;
    //FIXME:
    print(candidateMemberCardDataList[candidateMemberCardDataList
            .indexWhere((element) => element == candidateMemberCardData)]
        .isSelected);
    candidateMemberCardDataList.refresh();
  }
}
