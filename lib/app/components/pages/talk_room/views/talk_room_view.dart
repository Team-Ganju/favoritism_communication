import 'package:favoritism_communication/app/components/atoms/atoms.dart'
    as atoms;
import 'package:favoritism_communication/app/components/organisms/organisms.dart';
import 'package:favoritism_communication/app/styles/styles.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/talk_room_controller.dart';

class TalkRoomView extends GetView<TalkRoomController> {
  const TalkRoomView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(
        title:
            controller.chatService.follower.userName, //TalkMemberCard.roomName
        leading: const atoms.BackButton(),
        backgroundColor: colorTalkRoomAppBarBg,
      ),
      body: Stack(
        children: const [
          SingleChildScrollView(
            child: SafeArea(
              child: Text('ここはメッセージバルーンのListView.builderに置き換わる'),
            ),
          ),
          MessageBar(),
        ],
      ),
    );
  }
}
