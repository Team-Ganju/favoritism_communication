import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:favoritism_communication/app/styles/styles.dart';
import 'package:favoritism_communication/app/components/organisms/multi_option_select_button.dart';
import 'package:favoritism_communication/app/components/atoms/custom_chip.dart';
import 'package:favoritism_communication/app/components/atoms/alternate_circle_chip.dart';
import '../controllers/search_filter_controller.dart';

/// 性別
/// ドロップダウンで選択時に設定される値
enum Gender{
  male,
  female,
}

/// 性別
/// ドロップダウンで選択時に表示される値
extension GenderText on Gender{
  String get label{
    switch(this){
      case Gender.male:
        return '男性';

      case Gender.female:
        return '女性';
    }
  }
}

class SearchFilterView extends GetView<SearchFilterController> {
  const SearchFilterView({Key? key}) : super(key: key);

  static const int targetAgeLimitMin = 18;    // 対象年齢の最小値
  static const int targetAgeLimitMax = 100;   // 対象年齢の最大値
  static const EdgeInsetsGeometry fieldPadding = EdgeInsets.all(8.0); // 入力フィールドのパディング

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

                MultiOptionSelectButton(
                  selectedItems: const [
                    Text("Flutter大学"),
                  ],
                  label: 'コミュニティ',
                  onTap: () => {  },
                ),

                Row(
                  children: [
                    SizedBox(
                      width: context.width/2,
                      child: _buildDropDownButton<Gender>(
                        context: context,
                        items: _constructGenderItems(),
                        label: '性別',
                        onChanged: (Gender? age) => {}, //TODO: 値の更新処理
                        value: Gender.male,
                      ),
                    ),

                    SizedBox(
                      width: context.width/2,
                      child: _buildDropDownButton<int>(
                        context: context,
                        items: _constructAgeItems(),
                        label: '年代',
                        onChanged: (int? age) => {}, //TODO: 値の更新処理
                        value: 2000,
                      ),
                    ),
                  ]
                ),
              ],
            ),
          ),
        ]
      ),
    );
  }


  /// ドロップダウンボタンの生成
  Widget _buildDropDownButton<T>({
    required BuildContext context,
    required List<DropdownMenuItem<T>> items,
    String? label,
    void Function(T? value)? onChanged,
    T? value,
  }){
    return Padding(
      padding: fieldPadding,
      child: InputDecorator(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 12),
          label: label != null ? Text(label) : null,
          border: const OutlineInputBorder(),
        ),
        child: DropdownButton<T>(
          menuMaxHeight: MediaQuery.of(context).size.height / 3,  // ドロップダウン表示は画面高さの1/3まで
          underline: Container(),
          isExpanded: true,
          items: items,
          onChanged: onChanged,
          value: value,
        ),
      ),
    );
  }

  /// 性別のドロップダウンアイテムを構築
  List<DropdownMenuItem<Gender>> _constructGenderItems(){
    return [
      DropdownMenuItem(
        value: Gender.male,
        child: Text(Gender.male.label),
      ),
      DropdownMenuItem(
        value: Gender.female,
        child: Text(Gender.female.label),
      )
    ];
  }

  /// 年代のドロップダウンアイテムを構築
  List<DropdownMenuItem<int>> _constructAgeItems(){
    // 現在の西暦をもとに、生まれ年の最小と最大を算出
    int min = DateTime.now().year - targetAgeLimitMax;
    int max = DateTime.now().year - targetAgeLimitMin;
    return List<DropdownMenuItem<int>>.generate(
        (max-min + 1),  // 最小と最大を含んだ数分リスト生成
            (i)  {
          return DropdownMenuItem(
            value: min + i,
            child: Text((min + i).toString()),
          );
        }
    );
  }
}
