import 'package:favoritism_communication/app/services/services.dart';
import 'package:favoritism_communication/app/components/organisms/organisms.dart';
import 'package:favoritism_communication/app/dummy_data/candidate_member_card_dummy_data.dart';
import 'package:get/get.dart';

class CreateChatGroupController extends GetxController {
  final RxList searchResult = [].obs;

  final isFocusedOnSearchBar = false.obs;
  final RxList<CandidateMemberCardData> candidateMemberCardDataList =
      <CandidateMemberCardData>[].obs;
  final RxList<CandidateMemberCardData> selectedMemberDataList =
      <CandidateMemberCardData>[].obs;

  final SearchService searchService = Get.find();

  @override
  void onInit() {
    searchService.getTargetUsers();
    fetchMutualFollowUserData();
    super.onInit();
  }

  ///相互フォローのユーザーを取得するメソッド
  // TODO: firebase構築後、検索処理を書く
  void fetchMutualFollowUserData() {
    candidateMemberCardDataList.assignAll(candidateMemberCardList);
    candidateMemberCardDataList.refresh();
  }

  /// 検索バーに入力されたテキストに合致するユーザーを取得するメソッド
  void searchUser(String searchTarget) {
    searchService.waitInputAndSearch(searchTarget);
    searchResult.value = searchService.results;
  }

  /// トークする友達を選択済みに更新し、選択済みユーザーリストに追加するメソッド
  void select(CandidateMemberCardData candidateMemberCardData) {
    //タップされたカードのユーザーを選択済みに更新
    candidateMemberCardDataList[candidateMemberCardDataList
            .indexWhere((element) => element == candidateMemberCardData)]
        .isSelected = true;

    //選択済みユーザーリストに追加
    selectedMemberDataList.add(candidateMemberCardDataList[
        candidateMemberCardDataList
            .indexWhere((element) => element == candidateMemberCardData)]);

    candidateMemberCardDataList.refresh();
  }

  /// トークする友達を未選択にし、選択済みユーザーリストから削除するメソッド
  void unselect(CandidateMemberCardData candidateMemberCardData) {
    //タップされたカードのユーザーを選択済みに更新
    candidateMemberCardDataList[candidateMemberCardDataList
            .indexWhere((element) => element == candidateMemberCardData)]
        .isSelected = false;

    //選択済みユーザーリストから削除
    selectedMemberDataList.remove(candidateMemberCardDataList[
        candidateMemberCardDataList
            .indexWhere((element) => element == candidateMemberCardData)]);

    candidateMemberCardDataList.refresh();
  }

  /// 選択されたユーザー数が1以上か判定するメソッド
  bool isSelectedAtLeastOne() {
    return selectedMemberDataList.isNotEmpty;
  }
}
