import 'package:favoritism_communication/app/services/services.dart';
import 'package:favoritism_communication/app/components/organisms/organisms.dart';
import 'package:favoritism_communication/app/dummy_data/chat_dummy_data.dart';
import 'package:get/get.dart';

class CreateChatGroupController extends GetxController {
  final RxList searchResult = [].obs;

  final isFocusedOnSearchBar = false.obs;
  final RxList<FriendCardData> friendCardDataList = <FriendCardData>[].obs;
  final RxList<FriendCardData> selectedMemberDataList = <FriendCardData>[].obs;

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
    friendCardDataList.assignAll(friendCardList);
    friendCardDataList.refresh();
  }

  /// 検索バーに入力されたテキストに合致するユーザーを取得するメソッド
  void searchUser(String searchTarget) {
    searchService.waitInputAndSearch(searchTarget);
    searchResult.value = searchService.results;
  }

  /// トークする友達を選択済みに更新し、選択済みユーザーリストに追加するメソッド
  void select(FriendCardData friendCardData) {
    //selectedMemberDataList内に未追加の場合のみ処理実行
    if (!selectedMemberDataList.contains(friendCardData)) {
      //タップされたカードのユーザーを選択済みに更新
      friendCardDataList[friendCardDataList
              .indexWhere((element) => element == friendCardData)]
          .isSelected = true;

      //選択済みユーザーリストに追加
      selectedMemberDataList.add(friendCardDataList[friendCardDataList
          .indexWhere((element) => element == friendCardData)]);

      friendCardDataList.refresh();
    }
  }

  /// トークする友達を未選択にし、選択済みユーザーリストから削除するメソッド
  void unselect(FriendCardData friendCardData) {
    //タップされたカードのユーザーを選択済みに更新
    friendCardDataList[friendCardDataList
            .indexWhere((element) => element == friendCardData)]
        .isSelected = false;

    //選択済みユーザーリストから削除
    selectedMemberDataList.remove(friendCardDataList[
        friendCardDataList.indexWhere((element) => element == friendCardData)]);

    friendCardDataList.refresh();
  }

  /// 選択されたユーザー数が1以上か判定するメソッド
  bool isSelectedAtLeastOne() {
    return selectedMemberDataList.isNotEmpty;
  }
}
