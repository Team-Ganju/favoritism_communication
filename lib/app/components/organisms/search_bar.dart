import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:get/get.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
    required this.searchTarget,
    required this.listController,
  }) : super(key: key);

  final List<String> searchTarget;
  final RxList listController;

  static const _searchIntervalMilliSecond = 1000; //1秒

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: '検索バー',
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          hintText: '検索',
          prefixIcon: const Icon(Icons.search),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(45),
          ),
          focusedBorder: OutlineInputBorder(
            //FIXME: テキスト入力時の下線の色は外部ファイルから指定
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(45),
          )),
      onChanged: (text) {
        _waitInputAndSearch(text);
      },
    );
  }

  //前方一致検索
  List<String> _prefixSearch(List<String> searchTargetList, String? text) {
    List<String> searchedResultList = [];

    if (text == null || text == '') {
      //処理なし：searchedResultListは空のまま
    } else {
      searchedResultList = searchTargetList
          .where(
              (element) => element.toLowerCase().startsWith(text.toLowerCase()))
          .toList();
    }
    return searchedResultList;
  }

  void _waitInputAndSearch(String? text) {
    //前回テキスト変更時Datetimeを更新
    DateTime lastChangedDatetime = DateTime.now();

    //一定時間間隔(_searchIntervalMilliSecond)以内にテキストの変更を検知した場合は_prefixSearchの実行を待つ
    Future.delayed(
      const Duration(milliseconds: _searchIntervalMilliSecond),
      () {
        final DateTime nowDatetime = DateTime.now();
        if (nowDatetime.difference(lastChangedDatetime).inMilliseconds >
            _searchIntervalMilliSecond) {
          listController.value = _prefixSearch(searchTarget, text);
        }
      },
    );
  }
}
