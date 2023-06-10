import 'package:favoritism_communication/app/repository/genre_repository.dart';
import 'package:get/get.dart';

class SearchGenreInfo {
  SearchGenreInfo({
    required this.id,
    required this.title,
    required this.isSelect,
  });

  final String id;
  final String title;
  final bool isSelect;
}

class SearchSelectGenreController extends GetxController {
  //TODO: 最初の読み込み時に非同期でデータを取得する処理
  //TODO: ジャンルが選択されたときにボタンをアクティブにする処理

  void selectGenre(String id){

  }

  Future<List<SearchGenreInfo>> get genreForSelect async {
    final List<SearchGenreInfo> genreInfo = [];   // genreInfoのリスト
    final IGenreRepository genreRepository = Get.find();
    final List<Map<String, dynamic>> genreMapList = await genreRepository.fetchUserGenre("0");

    for(Map<String, dynamic> genreMap in genreMapList){
      genreInfo.add(
        SearchGenreInfo(id: genreMap["genreId"], title: genreMap["title"], isSelect: false)
      );
    }
    return genreInfo;
  }
}
