import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context){
    final Widget? title = label != null ? Text(label!) : null;

    return SizedBox(
      width: width,
      height: height,
      child: CheckboxListTile(
        value: value,
        selectedTileColor: Colors.red,
        onChanged: onChanged,
        title: title,
        controlAffinity: ListTileControlAffinity.leading,
      ),
    );
  }
}
