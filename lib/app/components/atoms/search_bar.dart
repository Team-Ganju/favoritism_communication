import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: '検索',
      decoration: InputDecoration(
          hintText: '検索',
          prefixIcon: Icon(Icons.search),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(45),
          ),
          focusedBorder: UnderlineInputBorder(
            //FIXME: テキスト入力時の下線の色は外部ファイルから指定
            borderSide: BorderSide(color: Colors.grey),
          )),
      onChanged: (text) => search(text),
    );
  }

  void search(String? text) {}
}
