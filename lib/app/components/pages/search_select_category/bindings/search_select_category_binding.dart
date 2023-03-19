import 'package:get/get.dart';

import '../controllers/search_select_category_controller.dart';

class SearchSelectCategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchSelectCategoryController>(
      () => SearchSelectCategoryController(),
    );
  }
}
