import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  final void Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    //TODO: GestureDetectorでwrapしてFocusScope.of(context).unfocus()を実装したい。ホーム画面の検索バーとの調整が必要
    return FormBuilderTextField(
      name: '検索バー',
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: '検索',
        prefixIcon: const Icon(Icons.search),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(45),
        ),
        focusedBorder: OutlineInputBorder(
          //FIXME: テキスト入力時の下線の色は外部ファイルから指定
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(45),
        ),
      ),
      onChanged: (text) {
        onChanged.call(text);
      },
    );
  }
}
