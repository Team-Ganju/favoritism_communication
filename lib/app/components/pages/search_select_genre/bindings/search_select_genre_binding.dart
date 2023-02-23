import 'package:get/get.dart';

import '../controllers/search_select_genre_controller.dart';

class SearchSelectGenreBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchSelectGenreController>(
      () => SearchSelectGenreController(),
    );
  }
}
