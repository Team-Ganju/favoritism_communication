import 'package:favoritism_communication/app/components/atoms/atoms.dart'
    as atoms;
import 'package:favoritism_communication/app/components/organisms/organisms.dart';
import 'package:favoritism_communication/app/styles/styles.dart';
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
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: 2, //FIXME: 修正
            itemBuilder: (context, index) {
              //FIXME: のちに削除
              List<bool> isSender = [true, false];
              return Column(
                children: [
                  if (index == 0)
                    const SizedBox(
                      height: 20,
                    ),
                  isSender[index]
                      ? const atoms.ChatBubble(
                          text: 'テストテストテストテストテストテストテストテストテストテスト',
                          isSender: true,
                        )
                      : Row(
                          children: [
                            CircleAvatar(
                              //TODO:firebase接続後に動作確認
                              //profileImageURLがあればその画像を表示、なければグレー背景でpersonアイコンを表示
                              // foregroundImage: profileImageURL != null
                              //     ? NetworkImage(profileImageURL!)
                              //     : null,
                              backgroundColor: colorTalkMemberCardCircleBg,
                              child: const Icon(
                                Icons.person,
                                color: colorTalkMemberCardIcon,
                              ),
                            ),
                            const atoms.ChatBubble(
                              text: 'テストテストテストテストテストテストテストテストテストテスト',
                              isSender: false,
                            ),
                          ],
                        ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              );
            },
          ),
          const MessageBar(),
        ],
      ),
    );
  }
}
