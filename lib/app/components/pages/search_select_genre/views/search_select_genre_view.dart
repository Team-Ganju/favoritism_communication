import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/search_select_genre_controller.dart';

class SearchSelectGenreView extends GetView<SearchSelectGenreController> {
  const SearchSelectGenreView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SearchSelectGenreView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SearchSelectGenreView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
