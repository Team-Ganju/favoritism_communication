import 'package:get/get.dart';

class SearchFilterController extends GetxController {

  List<String> get  selectedCategoryNames {
    //TODO: 選択されたカテゴリを返す処理
    return [
      "カテゴリ1",
      "カテゴリ2",
      "カテゴリ3",
      "カテゴリ4",
      "カテゴリ5",
      "カテゴリ6",
      "カテゴリ7",
      "カテゴリ8",
      "カテゴリ9",
      "カテゴリ10",
    ];
  }

  List<String> get  selectedGenreNames {
    //TODO: 選択されたジャンルを返す処理
    return [
      "ジャンル1",
      "ジャンル2",
      "ジャンル3",
      "ジャンル4",
      "ジャンル5",
      "ジャンル6",
      "ジャンル7",
      "ジャンル8",
      "ジャンル9",
      "ジャンル10",
    ];
  }

  String get belongCommunity {
    //TODO: 所属しているコミュニティを返す処理
    return "Flutter大学";
  }

}
