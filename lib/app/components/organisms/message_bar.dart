import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class MessageBar extends StatelessWidget {
  const MessageBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(0, -1),
      child: Container(
        width: double.infinity,
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.black,
          ),
        ),
        child: Row(
          children: [
            IconButton(
              //TODO: カメラ機能は別途実装
              onPressed: () {},
              icon: const Icon(
                Icons.camera_alt_rounded,
                size: 32,
              ),
            ),
            IconButton(
              //TODO: 画像追加機能は別途実装
              onPressed: () {},
              icon: const Icon(
                Icons.photo,
                size: 32,
              ),
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
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey),
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
            ),
          ],
        ),
      ),
    );
  }
}
