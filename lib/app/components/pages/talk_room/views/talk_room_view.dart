import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/talk_room_controller.dart';

class TalkRoomView extends GetView<TalkRoomController> {
  const TalkRoomView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TalkRoomView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'TalkRoomView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
