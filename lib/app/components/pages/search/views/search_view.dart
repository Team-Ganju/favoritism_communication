import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:favoritism_communication/app/styles/styles.dart';
import 'package:favoritism_communication/app/components/organisms/nav_bar.dart';
import 'package:favoritism_communication/app/components/pages/search/controllers/search_controller.dart';
import 'package:favoritism_communication/app/routes/app_pages.dart';

class SearchView extends GetView<SearchController> {
  const SearchView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorSearchBg,
      appBar: NavBar(
        backgroundColor: colorSearchAppBarBg,
        toolbarHeight: 60,
        trailing: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.tune,
              size: 36,
            ),
            color: colorSearchAppBarIconFilter,
            onPressed: () {
              Get.toNamed(
                Routes.searchFilter,
              );
            },
          ),
        ],
        child: const Text("さがす",
            style: TextStyle(
              color: colorSearchAppBarTitle,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            )),
      ),
      body: const Center(
        child: Text(
          'SearchView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
