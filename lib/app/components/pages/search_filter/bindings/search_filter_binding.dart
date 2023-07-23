import 'package:get/get.dart';
import 'package:favoritism_communication/app/repository/genre_repository.dart';

import '../controllers/search_filter_controller.dart';

class SearchFilterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchFilterController>(
      () => SearchFilterController(),
    );
    Get.lazyPut<IGenreRepository>(
      () => GenreRepositoryStub(),
   );
  }
}
