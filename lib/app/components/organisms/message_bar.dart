import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../styles/app_theme_color.dart';

class MessageBar extends StatelessWidget {
  const MessageBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.only(
          left: 10,
          top: 10,
          right: 10,
          bottom: 20,
        ),
        width: double.infinity,
        height: 70,
        decoration: const BoxDecoration(
          color: colorMessageBarFg,
          border: Border(
            top: BorderSide(
              color: colorMessageBarBorder,
            ),
          ),
        ),
        child: Row(
          children: [
            IconButton(
              //TODO: カメラ機能は別途実装
              onPressed: () {},
              icon: const Icon(
                Icons.camera_alt_outlined,
                size: 32,
              ),
              padding: EdgeInsets.zero,
            ),
            IconButton(
              //TODO: 画像追加機能は別途実装
              onPressed: () {},
              icon: const Icon(
                Icons.photo_outlined,
                size: 32,
              ),
              padding: EdgeInsets.zero,
            ),
            Expanded(
              child: FormBuilderTextField(
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
                    borderSide: const BorderSide(
                        color: colorMessageBarInputBorderFocused),
                  ),
                ),
              ),
            ),
            IconButton(
              //TODO: 送信機能は別途実装
              onPressed: () {},
              icon: const Icon(
                Icons.send,
                size: 32,
              ),
              padding: EdgeInsets.zero,
            ),
          ],
        ),
      ),
    );
  }
}
