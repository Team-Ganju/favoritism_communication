import 'package:flutter/material.dart';

/// ドロップダウンボタン
class CustomDropDownButton<T> extends StatelessWidget {
  const CustomDropDownButton({
    super.key,
    required this.items,
    this.label,
    this.onChanged,
    this.value,
    this.menuMaxHeight,
    this.contentPadding,
    this.hint,
  });

  final List<DropdownMenuItem<T>> items;
  final String? label;
  final void Function(T? value)? onChanged;
  final T? value;
  final double? menuMaxHeight;
  final EdgeInsetsGeometry? contentPadding;
  final Widget? hint;

  static const contentPaddingDefault = EdgeInsets.symmetric(horizontal: 12);

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
        contentPadding: contentPadding ?? contentPaddingDefault,
        label: label != null ? Text(label!) : null,
        border: const OutlineInputBorder(),
      ),
      child: DropdownButton<T>(
        hint: hint,
        menuMaxHeight: menuMaxHeight,
        underline: Container(),
        isExpanded: true,
        items: items,
        onChanged: onChanged,
        value: value,
      ),
    );
  }
}
