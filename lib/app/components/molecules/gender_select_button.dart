import 'package:flutter/material.dart';
import 'package:favoritism_communication/app/services/gender_service.dart';
import 'package:favoritism_communication/app/components/atoms/custom_dropdown_button.dart';

/// 性別選択用ドロップダウンボタン
class GenderSelectButton extends CustomDropDownButton<Gender> {
  GenderSelectButton({
    super.key,
    String? label,
    void Function(Gender? value)? onChanged,
    Gender? value,
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

  static List<DropdownMenuItem<Gender>> _buildDropdownItems(){
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
}
