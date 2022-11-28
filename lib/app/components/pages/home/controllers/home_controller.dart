import 'package:favoritism_communication/app/components/organisms/user_card.dart';
import 'package:favoritism_communication/app/dummy_data/tab_dummy_data.dart';
import 'package:favoritism_communication/app/dummy_data/user_card_dummy_data.dart';
import 'package:favoritism_communication/app/services/services.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeController extends GetxController {
  final RxBool isFollowed = false.obs;
  // final RxList<UserCardData> userCardDataList = userCardList.obs;
  final RxList<UserCardData> userCardDataList = <UserCardData>[].obs;
  final RefreshController refreshController = RefreshController();
  final RxList<TabData> tabDataList = <TabData>[].obs;
  final TabService tabService = Get.find();
  final ChatService chatService = Get.find();

  @override
  void onInit() {
    fetchUserData();
    initTab(dummyTabNameList
        .map((name) => TabData(name, (tabData) {
              // todo: カードをフィルタする処理を追加
              selectTab(tabData);
            }))
        .toList());
    super.onInit();
  }

  /// todo: 検索結果取得処理を書く
  void fetchUserData() {
    userCardDataList.assignAll(userCardList);
    userCardDataList.refresh();
  }

  /// todo: プルアップした時の処理を書く（無限スクロール）
  void onLoading() async {
    try {
      // todo: 追加の検索結果取得処理を書く
      userCardDataList.addAll(userCardList);
      userCardDataList.refresh();
      await Future.delayed(const Duration(milliseconds: 100));
      refreshController.loadComplete();
    } catch (e) {
      Get.log(e.toString());
      refreshController.loadFailed();
    }
  }

  void initTab(List<TabData> list) {
    tabDataList.clear();
    tabDataList.addAll(list);
    tabDataList.refresh();
  }

  List<TabData> getTabList() {
    return tabDataList;
  }

  void selectTab(TabData data) async {
    for (var i = 0; i < tabDataList.length; i++) {
      if (tabDataList[i] == data) {
        tabDataList[i].isEnable = !tabDataList[i].isEnable;
      } else {
        tabDataList[i].isEnable = false;
      }
    }
    tabDataList.refresh();
  }

  void search(String text) async {
    try {
      var filteredList = userCardList
          .where((value) =>
              value.userName.toLowerCase().contains(text.toLowerCase()))
          .toList();
      userCardDataList.clear();
      userCardDataList.addAll(filteredList);
      userCardDataList.refresh();
      await Future.delayed(const Duration(milliseconds: 100));
      refreshController.loadComplete();
    } catch (e) {
      Get.log(e.toString());
      refreshController.loadFailed();
    }
  }

  /// todo: フォローするor解除するは処理が異なってくるのでメソッドを分ける
  /// フォローするメソッド
  void follow(UserCardData userCardData) {
    userCardDataList[
            userCardDataList.indexWhere((element) => element == userCardData)]
        .isFollowed = true;
    userCardDataList.refresh();
  }

  /// フォロー解除メソッド
  void unFollow(UserCardData userCardData) {
    userCardDataList[
            userCardDataList.indexWhere((element) => element == userCardData)]
        .isFollowed = false;
    userCardDataList.refresh();
  }
}

class TabData {
  final String title;
  bool isEnable = false;
  final Function(TabData data) onPressed;

  TabData(this.title, this.onPressed);
}
