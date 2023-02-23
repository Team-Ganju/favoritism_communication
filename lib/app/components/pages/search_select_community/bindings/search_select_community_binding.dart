import 'package:get/get.dart';

import '../controllers/search_select_community_controller.dart';

class SearchSelectCommunityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchSelectCommunityController>(
      () => SearchSelectCommunityController(),
    );
  }
}
