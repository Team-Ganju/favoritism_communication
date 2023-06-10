import 'package:get/get.dart';

import 'package:favoritism_communication/app/repository/genre_repository.dart';
import '../controllers/search_select_genre_controller.dart';

class SearchSelectGenreBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchSelectGenreController>(
      () => SearchSelectGenreController(),
    );

    Get.lazyPut<IGenreRepository>(
      () => GenreRepositoryStub(),  // ダミーデータのセット
    );
  }
}
