import 'package:flutter/material.dart';
import 'package:favoritism_communication/app/services/gender_service.dart';

class CustomCheckbox extends StatelessWidget{
  const CustomCheckbox({
    super.key,
    this.label,
    this.onChanged,
    this.value=false,
    this.height,
    this.width,
  });

  final String? label;
  final void Function(bool? value)? onChanged;
  final bool value;
  final double? height;
  final double? width;

  static const Size defaultSizeOnlyCheckBox = Size(30, 40);
  static const Size defaultSizeWithLabel = Size(140, 40);

  @override
  Widget build(BuildContext context){
    final Widget? title = label != null ? Text(label!) : null;
    final Size defaultSize = label != null ? defaultSizeWithLabel : defaultSizeOnlyCheckBox;

    return SizedBox(
      width: width ?? defaultSize.width,
      height: height ?? defaultSize.height,
      child: Center(
        child: CheckboxListTile(
          value: value,
          onChanged: onChanged,
          title: title,
          controlAffinity: ListTileControlAffinity.leading,
        ),
      ),
    );

  }
}
