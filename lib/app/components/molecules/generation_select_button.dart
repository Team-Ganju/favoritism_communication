import 'package:flutter/material.dart';
import 'package:favoritism_communication/app/components/atoms/custom_dropdown_button.dart';
import 'package:favoritism_communication/app/services/generation_service.dart';

/// 年代選択用ドロップダウンボタン
class GenerationSelectButton extends CustomDropDownButton<Generation> {
  GenerationSelectButton({
    super.key,
    String? label,
    void Function(Generation? value)? onChanged,
    Generation? value,
    double? menuMaxHeight,
    EdgeInsetsGeometry? contentPadding,
    Widget? hint,
  }) : super(
    items: _buildDropdownItems(),
    label: label,
    onChanged: onChanged,
    value: value,
    menuMaxHeight: menuMaxHeight,
    contentPadding: contentPadding,
    hint: hint,
  );

  static List<DropdownMenuItem<Generation>> _buildDropdownItems(){
    return Generation.values.map((Generation value) {
      return DropdownMenuItem(
        value: value,
        child: Text(value.label),
      );
    }).toList();
  }
}
