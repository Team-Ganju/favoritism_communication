import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class SearchBar extends StatelessWidget {
  SearchBar({
    Key? key,
    this.contentPadding = EdgeInsets.zero,
    this.borderRadius = 45,
    required this.onChanged,
  }) : super(key: key);

  EdgeInsets contentPadding;
  double borderRadius;
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
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        focusedBorder: OutlineInputBorder(
          //FIXME: テキスト入力時の下線の色は外部ファイルから指定
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      onChanged: (text) {
        onChanged.call(text);
      },
    );
  }
}
