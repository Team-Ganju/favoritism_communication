import 'dart:ffi';

import 'package:favoritism_communication/app/modules/components/nav_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/chat_controller.dart';

class ChatView extends GetView<ChatController> {
  ChatView({Key? key}) : super(key: key);

  final chatController = Get.put(ChatController());

  //TODO: チャット画面実装時にグループトークリストとの繋ぎこみを作成
  //TODO: 動作確認のためテスト値を入れている。本来は[]で初期化。
  List<TalkMemberCard> individualTalkMemberCardList = [
    TalkMemberCard(
      //TODO: サンプルのため後で削除
      roomName: '文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認',
      mostRecentMessage:
          '文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認',
      profileImageURL: null,
    ),
    TalkMemberCard(
      //TODO: サンプルのため後で削除
      roomName: 'Aさん',
      mostRecentMessage: '私も〇〇好きです',
      profileImageURL: null,
    ),
    TalkMemberCard(
      //TODO: サンプルのため後で削除
      roomName: 'Aさん',
      mostRecentMessage: '私も〇〇好きです',
      profileImageURL: null,
    ),
    TalkMemberCard(
      //TODO: サンプルのため後で削除
      roomName: 'Aさん',
      mostRecentMessage: '私も〇〇好きです',
      profileImageURL: null,
    ),
    TalkMemberCard(
      //TODO: サンプルのため後で削除
      roomName: 'Aさん',
      mostRecentMessage: '私も〇〇好きです',
      profileImageURL: null,
    ),
    TalkMemberCard(
      //TODO: サンプルのため後で削除
      roomName: 'Aさん',
      mostRecentMessage: '私も〇〇好きです',
      profileImageURL: null,
    ),
    TalkMemberCard(
      //TODO: サンプルのため後で削除
      roomName: 'Aさん',
      mostRecentMessage: '私も〇〇好きです',
      profileImageURL: null,
    ),
    TalkMemberCard(
      //TODO: サンプルのため後で削除
      roomName: 'Aさん',
      mostRecentMessage: '私も〇〇好きです',
      profileImageURL: null,
    ),
    TalkMemberCard(
      //TODO: サンプルのため後で削除
      roomName: 'Aさん',
      mostRecentMessage: '私も〇〇好きです',
      profileImageURL: null,
    ),
  ];
  //TODO: チャット画面実装時にグループトークリストとの繋ぎこみを作成
  //TODO: 動作確認のためテスト値を入れている。本来は[]で初期化。
  List<TalkMemberCard> groupTalkMemberCardList = [
    TalkMemberCard(
      //TODO: サンプルのため後で削除
      roomName: 'グループA',
      mostRecentMessage: '私も〇〇好きです',
      profileImageURL: null,
    ),
    TalkMemberCard(
      //TODO: サンプルのため後で削除
      roomName: 'グループB',
      mostRecentMessage: '私も〇〇好きです',
      profileImageURL: null,
    ),
    TalkMemberCard(
      //TODO: サンプルのため後で削除
      roomName: 'グループC',
      mostRecentMessage: '私も〇〇好きです',
      profileImageURL: null,
    ),
    TalkMemberCard(
      //TODO: サンプルのため後で削除
      roomName: 'グループD',
      mostRecentMessage: '私も〇〇好きです',
      profileImageURL: null,
    ),
    TalkMemberCard(
      //TODO: サンプルのため後で削除
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
            //TODO: チャット画面実装時にonpressedの画面切替処理を実装
            onPressed: () {
              chatController.flagInversion(chatController.isGroupTalk);
            },
            icon: Obx(
              () => chatController.isGroupTalk.value
                  ? const Icon(
                      Icons.groups,
                      //TODO: アイコンサイズを32に統一する
                      color: Colors.blue,
                    )
                  : Icon(
                      Icons.groups,
                      size: 32,
                      color: Colors.grey[350],
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
                      color: Colors.grey[350],
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
          onPressed: () {},
          backgroundColor: Colors.blue,
          child: const Icon(Icons.person_add_alt_1),
        ),
      ),
    );
  }
}

class TalkMemberCard extends GetView<ChatController> {
  const TalkMemberCard({
    Key? key,
    required this.roomName,
    required this.mostRecentMessage,
    required this.profileImageURL,
  }) : super(key: key);

  final String roomName;
  final String mostRecentMessage;
  final profileImageURL;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            CircleAvatar(
              //TODO:firebase接続後に動作確認
              //profileImageURLがあればその画像を表示、なければグレー背景でpersonアイコンを表示
              foregroundImage: profileImageURL != null
                  ? NetworkImage(profileImageURL)
                  : null,
              backgroundColor: Colors.grey,
              child: const Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    roomName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 20),
                  ),
                  Text(
                    mostRecentMessage,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
