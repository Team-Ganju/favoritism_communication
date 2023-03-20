import 'package:favoritism_communication/app/components/atoms/atoms.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:favoritism_communication/app/styles/styles.dart';
import 'package:favoritism_communication/app/components/organisms/multi_option_select_button.dart';
import 'package:favoritism_communication/app/components/atoms/custom_chip.dart';
import 'package:favoritism_communication/app/components/atoms/alternate_circle_chip.dart';
import 'package:favoritism_communication/app/routes/app_pages.dart';
import 'package:favoritism_communication/app/components/molecules/gender_select_checkbox.dart';
import '../../../../services/gender_service.dart';
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
              padding: const EdgeInsets.all(8.0),
              physics: const NeverScrollableScrollPhysics(),
              children: <Widget>[
                MultiOptionSelectButton(
                  selectedItems: controller.selectedGenreNames.map(
                    (name) => AlternateCircleChip(
                                isPushed: false,
                                onPressed: null,
                                child: Text(name),
                              )
                  ).toList(),
                  label: 'ジャンル',
                  emptyChild: const Text(
                    'こだわらない',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () => Get.toNamed(Routes.searchSelectGenre,),
                ),

                MultiOptionSelectButton(
                  selectedItems: controller.selectedCategoryNames.map(
                    (name) => CustomChip(
                                backgroundColor: Colors.white,
                                onTap: null,
                                chipTitle: name,
                              )
                  ).toList(),
                  label: 'カテゴリ',
                  emptyChild: const Text(
                    'こだわらない',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () => Get.toNamed(Routes.searchSelectCategory,),
                ),

                MultiOptionSelectButton(
                  selectedItems: controller.belongCommunities.map(
                    (community) => Text(community)
                  ).toList(),
                  label: 'コミュニティ',
                  emptyChild: const Text(
                    'こだわらない',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () => Get.toNamed(Routes.searchSelectCommunity,),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 8, left: 8, right: 8),
                      child: Text(
                        '性別',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Row(
                        children: [
                          Obx(() => GenderSelectCheckbox(
                            values: controller.selectedGender,
                            onChanged: (gender, value){
                              controller.changeGender(gender, value);
                            },
                          ),
                          ),
                        ]
                    ),
                  ]
                ),
              ],
            ),
          ),
        ]
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.grey, width: 0.5),
          ),
        ),

        child: Padding(
          padding: const EdgeInsets.all(16.0),   // floatingActionButtonにした時にtopBorderに近くなるので、上に余白をつけたい
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(context.width * 0.4, 25),
                    foregroundColor: colorClearSearchFilterButtonFg,
                    backgroundColor: colorClearSearchFilterButtonBg,
                    shape: const StadiumBorder(),
                    elevation: 0,
                  ),
                  onPressed: () {},
                  child: const Text('検索条件をクリア'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(context.width * 0.4, 25),
                    foregroundColor: colorSearchButtonFg,
                    backgroundColor: colorSearchButtonBg,
                    shape: const StadiumBorder(),
                    elevation: 0,
                  ),
                  onPressed: () {},
                  child: const Text('この条件で検索'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}


