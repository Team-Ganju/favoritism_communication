import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/search_select_community_controller.dart';

class SearchSelectCommunityView
    extends GetView<SearchSelectCommunityController> {
  const SearchSelectCommunityView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SearchSelectCommunityView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SearchSelectCommunityView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
