import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FormBuilderTextField(
        name: '検索',
        decoration: InputDecoration(
          hintText: '検索',
          prefixIcon: Icon(Icons.search),
        ),
        onChanged: (text) => search(text),
      ),
    );
  }

  void search(String? text) {}
}
