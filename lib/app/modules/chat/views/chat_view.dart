import 'dart:ffi';

import 'package:favoritism_communication/app/modules/components/nav_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/chat_controller.dart';

class ChatView extends GetView<ChatController> {
  const ChatView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: NavBar(
        title: 'トーク',
        backgroundColor: Colors.pinkAccent,
        hasBackButton: false,
      ),
      body: Center(
        child: TalkMemberCard(
          //TODO: サンプルのため後で削除
          roomName: '123456789012345678901234567890', 
          mostRecentMessage: '12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890',
          profileImageURL: null,
          ),
      ),
    );
  }
}

class TalkMemberCard extends GetView<ChatController> {
  const TalkMemberCard({Key? key, required this.roomName, required this.mostRecentMessage, required this.profileImageURL}) : super(key: key);

  final String roomName;
  final String mostRecentMessage;
  final profileImageURL;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0),),
      child: Padding(
        padding: const EdgeInsets.all(15), 
        child: Row(
          children: [
            CircleAvatar(
              //TODO:firebase接続後に動作確認
              //profileImageURLがあればその画像を表示、なければグレー背景でpersonアイコンを表示
              foregroundImage: profileImageURL != null ? NetworkImage(profileImageURL) : null, 
              backgroundColor: Colors.grey,
              child: const Icon(Icons.person, color: Colors.white,),
            ), 
            const SizedBox(width: 20,),
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
