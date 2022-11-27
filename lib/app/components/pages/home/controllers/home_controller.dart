import 'package:favoritism_communication/app/components/organisms/user_card.dart';
import 'package:favoritism_communication/app/dummy_data/user_card_dummy_data.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeController extends GetxController {
  final RxBool isFollowed = false.obs;
  // final RxList<UserCardData> userCardDataList = userCardList.obs;
  final RxList<UserCardData> userCardDataList = <UserCardData>[].obs;
  final RefreshController refreshController = RefreshController();
  final RxBool needScrollToTop = false.obs;

  final scrollController = ScrollController();

  @override
  void onInit() {
    fetchUserData();
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
