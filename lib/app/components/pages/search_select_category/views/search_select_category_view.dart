import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/search_select_category_controller.dart';

class SearchSelectCategoryView extends GetView<SearchSelectCategoryController> {
  const SearchSelectCategoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SearchSelectCategoryView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SearchSelectCategoryView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
