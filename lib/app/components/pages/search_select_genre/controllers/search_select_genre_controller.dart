import 'package:favoritism_communication/app/repository/genre_repository.dart';
import 'package:get/get.dart';

class SearchSelectGenreController extends GetxController {

  Future<List<String>> get genreForSelect async {
    IGenreRepository genreRepository = Get.find();
    List<Map<String, dynamic>> genreMapList = await genreRepository.fetchUserGenre("0");
    return genreMapList.map<String>(
      (Map<String, dynamic> genreMap) {
        return genreMap["title"];
      }
    ).toList();
  }


}
