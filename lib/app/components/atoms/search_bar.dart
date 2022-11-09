import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
    required this.searchTarget,
  }) : super(key: key);

  final List<String> searchTarget;

  static const _searchIntervalMilliSecond = 5000;

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: '検索',
      decoration: InputDecoration(
          hintText: '検索',
          prefixIcon: const Icon(Icons.search),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(45),
          ),
          focusedBorder: const UnderlineInputBorder(
            //FIXME: テキスト入力時の下線の色は外部ファイルから指定
            borderSide: BorderSide(color: Colors.grey),
          )),
      onChanged: (text) {
        _waitInputAndSearch(text);
      },
    );
  }

  List<String> _prefixSearch(List<String> searchTargetList, String? text) {
    //HACK: 現在は大文字・小文字を区別しているが、区別しない方が良い場合は修正
    List<String> searchedResultList = [];
    searchedResultList =
        searchTargetList.where((element) => element.startsWith(text!)).toList();
    return searchedResultList;
  }

  void _waitInputAndSearch(String? text) {
    //実行開始時の時間を更新
    DateTime lastPressedDatetime = DateTime.now();

    //一定時間間隔(_searchIntervalMilliSecond)以内にテキストの変更を検知した場合は_prefixSearchの実行を待つ
    Future.delayed(
      const Duration(milliseconds: _searchIntervalMilliSecond),
      () {
        final DateTime nowDatetime = DateTime.now();
        if (nowDatetime.difference(lastPressedDatetime).inMilliseconds >
            _searchIntervalMilliSecond) {
          _prefixSearch(searchTarget, text);
        }
      },
    );
  }
}
