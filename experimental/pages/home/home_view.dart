import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/demouser.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    DemoUser user = Get.arguments;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 50.0),
        child: Align(
          alignment: Alignment.topCenter,
          child: Text('ユーザID:${user.uid}'),  //TODO: ログインユーザーのIDを表示
        ),
      ),
    );
  }
}
