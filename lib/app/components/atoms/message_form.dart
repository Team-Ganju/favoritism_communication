import 'package:favoritism_communication/app/styles/styles.dart';
import 'package:flutter/material.dart';

import 'package:flutter_form_builder/flutter_form_builder.dart';

class MessageForm extends StatelessWidget {
  const MessageForm({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      controller: controller,
      name: 'メッセージバー',
      style: const TextStyle(
        fontSize: 16,
      ),
      maxLength: 500, //TODO: 最大文字数は要検討。（現在はLINEの最大文字数)
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: 'テキストを追加',
        counterText: '',
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: colorMessageBarInputBorder,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:
              const BorderSide(color: colorMessageBarInputBorderFocused),
        ),
      ),
    );
  }
}
