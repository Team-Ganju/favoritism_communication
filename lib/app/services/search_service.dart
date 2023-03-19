import 'package:favoritism_communication/app/dummy_data/dummy_data.dart';
import 'package:get/get.dart';
import 'package:favoritism_communication/app/components/organisms/organisms.dart';

class SearchService extends GetxService {
  late List<String> targetUsers;
  RxList<String> results = <String>[].obs;
  RxString target = ''.obs;

  //FIXME: firebase構築後に関数全体のデータ取得先、取得方法を変更
  void getTargetUsers() {
    final List<String> users = [];

    // FriendCardData
    for (FriendCardData element in friendCardList) {
      users.add(element.userName);
    }

    targetUsers = users;
  }

  //前方一致検索
  void prefixSearch(String? text) {
    List<String> searchedResults = [];

    if (text == null || text == '') {
      //処理なし：searchedResultListは空のまま
    } else {
      searchedResults = targetUsers
          .where(
              (element) => element.toLowerCase().startsWith(text.toLowerCase()))
          .toList();
    }
    results.assignAll(searchedResults);
  }
}
