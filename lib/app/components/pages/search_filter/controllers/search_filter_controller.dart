import 'package:get/get.dart';
import 'package:favoritism_communication/app/data/gender/gender.dart';
import 'package:favoritism_communication/app/repository/genre_repository.dart';

class SearchFilterController extends GetxController {
  final Rx<Map<Gender, bool>> _gender = Rx<Map<Gender, bool>>({});
  final Rx<List<String>> _genreIds = Rx<List<String>>([]);
  final Rx<Map<String, Map<String, dynamic>>> _genreMap = Rx<Map<String, Map<String, dynamic>>>({}); // idとjsonデータのマップ

  @override
  void onInit() async{
    updateGenreMap();
    // 初期値で性別は全てTrueにする
    for (Gender gender in Gender.values) {
      changeGender(gender, true);
    }
    super.onInit();
  }

  Future updateGenreMap() async {
    final IGenreRepository genreRepository = Get.find();
    _genreMap.value = _createGenreMap(await genreRepository.fetchUserGenre("0"));  //TODO: ユーザIDを渡す
  }

  Map<String, Map<String, dynamic>> _createGenreMap(List<Map<String, dynamic>> mapList){
    final Map<String, Map<String, dynamic>> map = {};
    for(Map<String, dynamic> genre in mapList){
      map[genre["genreId"]] = genre;
    }
    return map;
  }

  String get genreId {
    if(_genreIds.value.isEmpty) return "";
    return _genreIds.value.first;
  }

  set genreId(String v){
    updateGenreMap();
    if(v != ""){
      _genreIds.value = [v];
    }
    else{
      _genreIds.value = [];
    }
  }

  List<String> get selectedCategoryNames {
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

  List<String> get selectedGenreNames {
    return _genreIds.value.map((e){
        var title = _genreMap.value[e]?["title"];
        if(title is String){
          return title;
        }
        else{
          return "";
        }
      }
    ).toList();
  }

  List<String> get belongCommunities {
    //TODO: 所属しているコミュニティを返す処理
    return []; //"Flutter大学";
  }

  Map<Gender, bool> get selectedGender => _gender.value;

  /// 性別セレクトボックス押下時処理
  void changeGender(Gender? gender, bool? value) {
    if (gender == null) return;

    // Mapのアドレスを更新し、GetXに通知する。
    Map<Gender, bool> clone = {..._gender.value};
    clone[gender] = value ?? false;
    _gender.value = clone;
  }

}
