import 'package:flutter/material.dart';
import 'package:favoritism_communication/app/services/gender_service.dart';
import 'package:favoritism_communication/app/components/atoms/custom_checkbox.dart';

class GenderSelectCheckbox extends StatelessWidget{
  const GenderSelectCheckbox({
    super.key,
    this.onChanged,
    this.values,
  });

  final Map<Gender, bool>? values;
  final void Function(Gender? gender, bool? value)? onChanged;

  @override
  Widget build(BuildContext context){
    return Row(
      children: Gender.values.map((gender){
        return CustomCheckbox(
          label: gender.label,
          value: values?[gender] ?? false,
          onChanged: (value) => onChanged?.call(gender, value),
        );
      }).toList(),
    );
  }
}
