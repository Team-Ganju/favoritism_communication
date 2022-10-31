import 'package:favoritism_communication/app/modules/components/nav_bar.dart';
import 'package:favoritism_communication/app/modules/chat/views/talk_member_card.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/chat_controller.dart';

class ChatView extends GetView<ChatController> {
  ChatView({Key? key}) : super(key: key);

  final chatController = Get.put(ChatController());

  //FIXME: チャット画面実装時にグループトークリストとの繋ぎこみを作成
  //       動作確認のためテスト値を入れている。本来は[]で初期化。
  final List<TalkMemberCard> individualTalkMemberCardList = [
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
  final List<TalkMemberCard> groupTalkMemberCardList = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(
        title: 'トーク',
        backgroundColor: Colors.white,
        hasBackButton: false,
        trailing: <Widget>[
          IconButton(
            //TODO: トーク画面実装時にonpressedの画面切替処理を実装
            onPressed: () {
              chatController.flagInversion(chatController.isGroupTalk);
            },
            icon: Obx(
              () => chatController.isGroupTalk.value
                  ? const Icon(
                      Icons.groups,
                      size: 32,
                      color: Colors.blue,
                    )
                  : Icon(
                      Icons.groups,
                      size: 32,
                      color: Colors.grey.shade300,
                    ),
            ),
          ),
          IconButton(
            //TODO: トーク画面実装時にonpressedの画面切替処理を実装
            onPressed: () {
              chatController.flagInversion(chatController.isGroupTalk);
            },
            icon: Obx(
              () => chatController.isGroupTalk.value
                  ? Icon(
                      Icons.person,
                      color: Colors.grey.shade300,
                    )
                  : const Icon(
                      Icons.person,
                      color: Colors.blue,
                    ),
            ),
          ),
        ],
      ),
      body: Obx(
        () => ListView(
          children: chatController.isGroupTalk.value
              ? groupTalkMemberCardList
              : individualTalkMemberCardList,
        ),
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.only(
          bottom: 100,
        ),
        child: FloatingActionButton(
          //TODO: トーク画面実装時にonpressedの画面切替処理を実装
          onPressed: () {},
          backgroundColor: Colors.blue,
          child: const Icon(Icons.person_add_alt_1),
        ),
      ),
    );
  }
}
