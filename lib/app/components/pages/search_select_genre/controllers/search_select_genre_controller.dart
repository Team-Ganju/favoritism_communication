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
  late final List<Map<String, dynamic>> _genreMapList;
  final RxList<SearchGenreInfo> genreForSelect = <SearchGenreInfo>[].obs;
  String _selectGenreId = "";
  String get genreId => _selectGenreId;

  @override
  Future<void> onInit() async{
    final IGenreRepository genreRepository = Get.find();
    _genreMapList = await genreRepository.fetchUserGenre("0");  //TODO: ユーザIDを渡す
    _selectGenreId = Get.parameters["selected"] ?? "";
    _constructGenreInfoList(_genreMapList);
    super.onInit();
  }

  void _constructGenreInfoList(List<Map<String, dynamic>> genreMapList){
    genreForSelect.clear();
    for(Map<String, dynamic> genreMap in genreMapList){
      final isSelect = genreMap["genreId"] == _selectGenreId;
      genreForSelect.add(
          SearchGenreInfo(id: genreMap["genreId"], title: genreMap["title"], isSelect: isSelect)
      );
    }
    genreForSelect.refresh();
  }

  void selectGenre(String id){
    if(_selectGenreId == id){
      _selectGenreId = "";
    }
    else{
      _selectGenreId = id;
    }
    _constructGenreInfoList(_genreMapList);
  }
}
