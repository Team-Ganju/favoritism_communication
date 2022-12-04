import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 50.0),
        child: Align(
          alignment: Alignment.topCenter,
          child: Text('ユーザID:XXXX'),  //TODO: ログインユーザーのIDを表示
        ),
      ),
    );
  }
}
