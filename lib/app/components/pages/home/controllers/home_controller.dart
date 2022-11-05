import 'package:get/get.dart';

class HomeController extends GetxController {
  final RxBool isFollowed = false.obs;

  /// todo: フォローするor解除するは処理が異なってくるのでメソッドを分ける
  /// フォローするメソッド
  void follow() {
    isFollowed.value = true;
  }

  /// フォロー解除メソッド
  void unFollow() {
    isFollowed.value = false;
  }
}
