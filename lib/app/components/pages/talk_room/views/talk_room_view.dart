import 'package:flutter/material.dart';
import 'package:favoritism_communication/app/components/organisms/nav_bar.dart';
import 'package:favoritism_communication/app/components/atoms/atoms.dart'
    as atoms;

import 'package:get/get.dart';

import '../controllers/talk_room_controller.dart';

class TalkRoomView extends GetView<TalkRoomController> {
  const TalkRoomView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(
        title: Get.arguments[0], //TalkMemberCard.roomName
        leading: const atoms.BackButton(),
        backgroundColor: Colors.pink,
      ),
      body: const Center(
        child: Text(
          'TalkRoomView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
