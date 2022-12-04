import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ホーム')),
      body: const Align(
        alignment: Alignment.topCenter,
        child: Text('ユーザID:XXXX'),
      ),
    );
  }
}
