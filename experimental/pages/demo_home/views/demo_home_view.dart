import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/demo_home_controller.dart';

class DemoHomeView extends GetView<DemoHomeController> {
  const DemoHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                  'ユーザID:${controller.authService.uid.val}'), //TODO: ログインユーザーのIDを表示
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                  'ユーザー情報',
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildMenuItem(title: 'プロフィール情報登録'),
                _buildMenuItem(title: 'プロフィール情報閲覧'),
                _buildMenuItem(title: 'プロフィール情報編集'),
                _buildMenuItem(title: 'プロフィール削除', textColor: Colors.red),
              ],
            ),
          ),
        ],
      ),

    );
  }

  Widget _buildMenuItem({
    String? title,
    Color? textColor,
  }){
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.grey,
            width: 0.1,
          ),
          bottom: BorderSide(
            color: Colors.grey,
            width: 0.1,
          ),
        )
      ),
      child: ListTile(
        title: title!=null ? Text(title) : null,
        textColor: textColor ?? Colors.grey,
      ),
    );
  }
}
