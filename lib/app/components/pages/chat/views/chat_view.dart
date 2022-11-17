import 'package:favoritism_communication/app/components/organisms/nav_bar.dart';
import 'package:favoritism_communication/app/components/organisms/talk_member_card.dart';
import 'package:favoritism_communication/app/components/atoms/atoms.dart';
import 'package:favoritism_communication/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/chat_controller.dart';

//FIXME: チャット画面実装時にグループトークリストとの繋ぎこみを作成
//       動作確認のためテスト値を入れている。本来は[]で初期化。
List<TalkMemberCard> _individualTalkMemberCardList = [
  const TalkMemberCard(
    roomName: '文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認',
    mostRecentMessage:
        '文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認',
    profileImageURL: null,
  ),
  const TalkMemberCard(
    roomName: 'Aさん',
    mostRecentMessage: '私も〇〇好きです',
    profileImageURL: null,
  ),
  const TalkMemberCard(
    roomName: 'Aさん',
    mostRecentMessage: '私も〇〇好きです',
    profileImageURL: null,
  ),
  const TalkMemberCard(
    roomName: 'Aさん',
    mostRecentMessage: '私も〇〇好きです',
    profileImageURL: null,
  ),
  const TalkMemberCard(
    roomName: 'Aさん',
    mostRecentMessage: '私も〇〇好きです',
    profileImageURL: null,
  ),
  const TalkMemberCard(
    roomName: 'Aさん',
    mostRecentMessage: '私も〇〇好きです',
    profileImageURL: null,
  ),
  const TalkMemberCard(
    roomName: 'Aさん',
    mostRecentMessage: '私も〇〇好きです',
    profileImageURL: null,
  ),
  const TalkMemberCard(
    roomName: 'Aさん',
    mostRecentMessage: '私も〇〇好きです',
    profileImageURL: null,
  ),
  const TalkMemberCard(
    roomName: 'Aさん',
    mostRecentMessage: '私も〇〇好きです',
    profileImageURL: null,
  ),
];

//FIXME: チャット画面実装時にグループトークリストとの繋ぎこみを作成
//       動作確認のためテスト値を入れている。本来は[]で初期化。
List<TalkMemberCard> _groupTalkMemberCardList = [
  const TalkMemberCard(
    roomName: 'グループA',
    mostRecentMessage: '私も〇〇好きです',
    profileImageURL: null,
  ),
  const TalkMemberCard(
    roomName: 'グループB',
    mostRecentMessage: '私も〇〇好きです',
    profileImageURL: null,
  ),
  const TalkMemberCard(
    roomName: 'グループC',
    mostRecentMessage: '私も〇〇好きです',
    profileImageURL: null,
  ),
  const TalkMemberCard(
    roomName: 'グループD',
    mostRecentMessage: '私も〇〇好きです',
    profileImageURL: null,
  ),
  const TalkMemberCard(
    roomName: 'グループE',
    mostRecentMessage: '私も〇〇好きです',
    profileImageURL: null,
  ),
];

class ChatView extends GetView<ChatController> {
  const ChatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(
        title: 'トーク',
        backgroundColor: Colors.pinkAccent,
        trailing: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.person_add_alt_1,
              size: 30,
            ),
            color: Colors.grey,
            onPressed: () {
              Get.toNamed(
                Routes.createChatGroup,
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 45,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(45),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Obx(() => CustomActionChip(
                        avatar: const Icon(
                          Icons.groups,
                          size: 26,
                          color: Colors.grey,
                        ),
                        label: const Text('グループ'),
                        labelPadding:
                            const EdgeInsets.symmetric(horizontal: 13.0),
                        side: BorderSide.none,
                        backgroundColor: controller.isGroupTalk.value
                            ? Colors.yellow
                            : Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        onPressed: () {
                          controller.switchTalkPartner();
                        },
                      )),
                  Obx(() => CustomActionChip(
                        avatar: const Icon(
                          Icons.person,
                          color: Colors.grey,
                        ),
                        label: const Text('ペアトーク'),
                        labelPadding:
                            const EdgeInsets.symmetric(horizontal: 4.0),
                        side: BorderSide.none,
                        backgroundColor: controller.isGroupTalk.value
                            ? Colors.white
                            : Colors.yellow,
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        onPressed: () {
                          controller.switchTalkPartner();
                        },
                      )),
                ],
              ),
            ),
          ),
          Expanded(
            child: Obx(
              () => ListView(
                children: controller.isGroupTalk.value
                    ? _groupTalkMemberCardList
                    : _individualTalkMemberCardList,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
