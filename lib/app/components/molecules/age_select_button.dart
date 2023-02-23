import 'package:flutter/material.dart';
import 'package:favoritism_communication/app/components/atoms/custom_dropdown_button.dart';

/// 年代選択用ドロップダウンボタン
class AgeSelectButton extends CustomDropDownButton<int> {
  AgeSelectButton({
    super.key,
    required int ageLimMax,
    required int ageLimMin,
    String? label,
    void Function(int? value)? onChanged,
    int? value,
    double? menuMaxHeight,
    EdgeInsetsGeometry? contentPadding,
  }) : super(
    items: _buildDropdownItems(ageLimMax, ageLimMin),
    label: label,
    onChanged: onChanged,
    value: value,
    menuMaxHeight: menuMaxHeight,
    contentPadding: contentPadding,
  );

  static List<DropdownMenuItem<int>> _buildDropdownItems(int ageLimMax, int ageLimMin){
    // 現在の西暦をもとに、生まれ年の最小と最大を算出
    int min = DateTime.now().year - ageLimMax;
    int max = DateTime.now().year - ageLimMin;
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
