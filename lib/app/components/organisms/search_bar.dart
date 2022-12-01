import 'package:favoritism_communication/app/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
    this.contentPadding = EdgeInsets.zero,
    required this.onChanged,
  }) : super(key: key);

  final EdgeInsets contentPadding;
  final void Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: '検索バー',
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: '検索',
        prefixIcon: const Icon(Icons.search),
        contentPadding: contentPadding,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: colorSearchBarInputBorder,
          ),
          borderRadius: BorderRadius.circular(45),
        ),
        focusedBorder: OutlineInputBorder(
          //FIXME: テキスト入力時の下線の色は外部ファイルから指定
          borderSide: const BorderSide(color: colorSearchBarInputBorderFocused),
          borderRadius: BorderRadius.circular(45),
        ),
      ),
      onChanged: (text) {
        onChanged.call(text);
      },
    );
  }
}
