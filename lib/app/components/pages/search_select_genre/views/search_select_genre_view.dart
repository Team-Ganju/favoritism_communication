import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:favoritism_communication/app/styles/styles.dart';
import 'package:favoritism_communication/app/components/organisms/nav_bar.dart';
import 'package:favoritism_communication/app/components/atoms/alternate_circle_chip.dart';

import '../controllers/search_select_genre_controller.dart';

class SearchSelectGenreView extends GetView<SearchSelectGenreController> {
  const SearchSelectGenreView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: colorSearchFilterBg,
      appBar: NavBar(
        backgroundColor: Colors.white,
        toolbarHeight: 60,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 36,
          ),
          color: Colors.grey,
          onPressed: () {
            Get.back();
          },
        ),
        child: const Text("ジャンル",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          )
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: Text("ジャンルを1個選択してください",
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                )
              ),
            ),
            Obx(() => _buildGenreButton(
                controller.genreForSelect,
              ),
            )
          ],
        ),
      )
    );
  }

  Widget _buildGenreButton(List<SearchGenreInfo> genreInfo){
    List<Widget> genreChips = [];
    for(SearchGenreInfo info in genreInfo){
      genreChips.add(
        AlternateCircleChip(
          isPushed: info.isSelect,
          onPressed: () => controller.selectGenre(info.id),
          child: Text(info.title),
        ),
      );
    }

    return Wrap(
      runSpacing: 4.0,
      spacing: 4.0,
      children: genreChips,
    );
  }
}
