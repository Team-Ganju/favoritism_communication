import 'package:favoritism_communication/app/components/organisms/user_card.dart';
import 'package:favoritism_communication/app/dummy_data/user_card_dummy_data.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final RxBool isFollowed = false.obs;
  final RxList<UserCardData> userCardDataList = userCardList.obs;

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
