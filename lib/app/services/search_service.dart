import 'package:favoritism_communication/app/dummy_data/chat_dummy_data.dart';
import 'package:get/get.dart';
import 'package:favoritism_communication/app/components/organisms/organisms.dart';

class SearchService extends GetxService {
  late List<String> targetUsers;
  RxList<String> results = <String>[].obs;
  static const _searchIntervalMilliSecond = 1000; //1秒

  //FIXME: firebase構築後に関数全体のデータ取得先、取得方法を変更
  void getTargetUsers() {
    final List<String> users = [];

    // CandidateMemberCardData
    for (CandidateMemberCardData element in candidateMemberCardList) {
      users.add(element.userName);
    }

    targetUsers = users;
  }

  //前方一致検索
  List<String> _prefixSearch(String? text) {
    List<String> searchedResults = [];

    if (text == null || text == '') {
      //処理なし：searchedResultListは空のまま
    } else {
      searchedResults = targetUsers
          .where(
              (element) => element.toLowerCase().startsWith(text.toLowerCase()))
          .toList();
    }
    return searchedResults;
  }

  void waitInputAndSearch(String? text) {
    //前回テキスト変更時Datetimeを更新
    DateTime lastChangedDatetime = DateTime.now();

    //一定時間間隔(_searchIntervalMilliSecond)以内にテキストの変更を検知した場合は_prefixSearchの実行を待つ
    Future.delayed(
      const Duration(milliseconds: _searchIntervalMilliSecond),
      () {
        final DateTime nowDatetime = DateTime.now();
        if (nowDatetime.difference(lastChangedDatetime).inMilliseconds >
            _searchIntervalMilliSecond) {
          results.value = _prefixSearch(text);
        }
      },
    );
  }
}
