import 'package:get/get.dart';
import 'package:favoritism_communication/app/data/gender/gender.dart';

class SearchFilterController extends GetxController {
  final Rx<Map<Gender, bool>> _gender = Rx<Map<Gender, bool>>({});

  @override
  void onInit() {
    super.onInit();
    // 初期値で性別は全てTrueにする
    for (Gender gender in Gender.values) {
      changeGender(gender, true);
    }
  }

  List<String> get  selectedCategoryNames {
    //TODO: 選択されたカテゴリを返す処理
    return [
      // "カテゴリ1",
      // "カテゴリ2",
      // "カテゴリ3",
      // "カテゴリ4",
      // "カテゴリ5",
      // "カテゴリ6",
      // "カテゴリ7",
      // "カテゴリ8",
      // "カテゴリ9",
      // "カテゴリ10",
    ];
  }

  List<String> get  selectedGenreNames {
    //TODO: 選択されたジャンルを返す処理
    return [
      // "ジャンル1",
      // "ジャンル2",
      // "ジャンル3",
      // "ジャンル4",
      // "ジャンル5",
      // "ジャンル6",
      // "ジャンル7",
      // "ジャンル8",
      // "ジャンル9",
      // "ジャンル10",
    ];
  }

  List<String> get belongCommunities {
    //TODO: 所属しているコミュニティを返す処理
    return [];//"Flutter大学";
  }

  Map<Gender, bool> get selectedGender => _gender.value;

  /// 性別セレクトボックス押下時処理
  void changeGender(Gender? gender, bool? value){
    if(gender == null) return;

    // Mapのアドレスを更新し、GetXに通知する。
    Map<Gender, bool> clone = {..._gender.value};
    clone[gender] = value ?? false;
    _gender.value = clone;
  }
}
