import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    User user = Get.arguments;
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
