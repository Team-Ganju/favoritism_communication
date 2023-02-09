import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:favoritism_communication/app/styles/styles.dart';
import 'package:favoritism_communication/app/components/organisms/multi_option_select_button.dart';
import 'package:favoritism_communication/app/components/atoms/custom_chip.dart';
import 'package:favoritism_communication/app/components/atoms/alternate_circle_chip.dart';
import '../controllers/search_filter_controller.dart';

class SearchFilterView extends GetView<SearchFilterController> {
  const SearchFilterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorSearchFilterBg,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: colorSearchFilterAppBarTitle),
        backgroundColor: colorSearchFilterAppBarBg,
        toolbarHeight: 60,
        title: const Text("検索条件",
            style: TextStyle(
              color: colorSearchFilterAppBarTitle,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            )
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                MultiOptionSelectButton(
                  selectedItems: const [
                    AlternateCircleChip(
                        isPushed: false,
                        onPressed: null,
                        child: Text("ジャンル1"),
                    ),
                    AlternateCircleChip(
                        isPushed: false,
                        onPressed: null,
                      child: Text("ジャンル2"),
                    ),
                    AlternateCircleChip(
                        isPushed: false,
                        onPressed: null,
                      child: Text("ジャンル3"),
                    ),
                    AlternateCircleChip(
                        isPushed: false,
                        onPressed: null,
                      child: Text("ジャンル4"),
                    ),
                    AlternateCircleChip(
                        isPushed: false,
                        onPressed: null,
                      child: Text("ジャンル5"),
                    ),
                  ],
                  label: 'ジャンル',
                  onTap: () => {  },
                ),

                MultiOptionSelectButton(
                  selectedItems: const [
                    CustomChip(chipTitle: 'カテゴリ1', backgroundColor: Colors.white),
                    CustomChip(chipTitle: 'カテゴリ2', backgroundColor: Colors.white),
                    CustomChip(chipTitle: 'カテゴリ3', backgroundColor: Colors.white),
                    CustomChip(chipTitle: 'カテゴリ4', backgroundColor: Colors.white),
                    CustomChip(chipTitle: 'カテゴリ5', backgroundColor: Colors.white),
                    CustomChip(chipTitle: 'カテゴリ6', backgroundColor: Colors.white),
                    CustomChip(chipTitle: 'カテゴリ7', backgroundColor: Colors.white),
                    CustomChip(chipTitle: 'カテゴリ8', backgroundColor: Colors.white),
                    CustomChip(chipTitle: 'カテゴリ9', backgroundColor: Colors.white),
                    CustomChip(chipTitle: 'カテゴリ10', backgroundColor: Colors.white),
                  ],
                  label: 'カテゴリ',
                  onTap: () => {  },
                ),
              ],
            ),
          ),
        ]
      ),
    );
  }
}
