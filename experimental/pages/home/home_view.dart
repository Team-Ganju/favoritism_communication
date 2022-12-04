import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const _pagePadding = EdgeInsets.only(top: 50.0);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: _pagePadding,
        child: Align(
          alignment: Alignment.topCenter,
          child: Text('ユーザID:XXXX'),  //TODO: ログインユーザーのIDを表示
        ),
      ),
    );
  }
}
