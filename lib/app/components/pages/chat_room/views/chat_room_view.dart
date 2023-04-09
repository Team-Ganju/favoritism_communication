import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:favoritism_communication/app/components/atoms/atoms.dart'
    as atoms;
import 'package:favoritism_communication/app/components/organisms/organisms.dart';
import 'package:favoritism_communication/app/components/organisms/received_message.dart';
import 'package:favoritism_communication/app/components/organisms/sent_message.dart';
import 'package:favoritism_communication/app/models/chat_message_model.dart';
import 'package:favoritism_communication/app/styles/styles.dart';
import 'package:favoritism_communication/app/components/templates/custom_smartrefresher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/chat_room_controller.dart';

class ChatRoomView extends GetView<ChatRoomController> {
  const ChatRoomView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // FIXME: 仮でuid設定　Preferenceから取得？
    controller.authService.uid.val = "001";

    final roomName = controller.chatService.chatRoom.roomName;
    final messages = controller.chatService.chatRoom.messages;
    final focusNode = FocusNode();

    return Focus(
      focusNode: focusNode,
      child: GestureDetector(
        onTap: focusNode.requestFocus,
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: NavBar(
            title: roomName,
            leading: const atoms.BackButton(),
            backgroundColor: colorChatRoomAppBarBg,
          ),
          body: Obx(
            () => Stack(
              children: [
                // TODO: 表示順はchatRooms.createdAtの昇順にする
                CustomSmartRefresher(
                  refreshController: controller.refreshController,
                  enablePullDown: false,
                  enablePullUp: false,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      final senderId = messages[index]['senderId'];
                      final message = messages[index]['message'];
                      final profileImage = messages[index]['profileImage'];
                      final senderName = messages[index]['senderName'];

                      return Column(
                        children: [
                          if (index == 0)
                            const SizedBox(
                              height: 20,
                            ),
                          controller.isSender(senderId)
                              ? SentMessage(
                                  text: message,
                                )
                              : ReceivedMessage(
                                  profileImage: profileImage,
                                  senderName: senderName,
                                  text: message,
                                ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      );
                    },
                  ),
                ),
                MessageBar(
                  controller: controller.messageTextController.value,
                  onCameraPressed: () {}, //TODO: カメラ機能は別途実装
                  onPhotoPressed: () {}, //TODO: 画像追加機能は別途実装
                  onSendPressed: _onSendPressed, //TODO: 送信機能は別途実装
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onSendPressed() {
    if (controller.messageTextController.value.text == '') {
      return;
    }
    final senderId = controller.authService.uid.val;
    final senderName = controller.authService.userName.val;
    final profileImage = controller.authService.profileImage.val;
    final messageText = controller.messageTextController.value.text;

    final message = ChatMessageModel(
      senderId: senderId,
      senderName: senderName,
      profileImage: profileImage,
      media: null, // TODO: メディア追加機能作成時にテキストと画像を同時に送れるようにする？
      message: messageText,
      createdAt: FieldValue.serverTimestamp(),
    );

    _insertMessage(message);

    // 入力欄を初期化
    controller.messageTextController.value.text = '';
  }

  // TODO: firebase接続後はこの関数を使用　動作未確認
  // void _insertMessage(ChatMessageModel message) async {
  //   final roomId = controller.chatService.chatRoom.roomId;
  //   final content = message.toJson();
  //   await FirebaseFirestore.instance
  //       .collection('chatRooms')
  //       .doc(roomId)
  //       .update({
  //     'message': FieldValue.arrayUnion([content]),
  //   });
  // }

  // TODO: firebase接続後はこの関数は削除
  void _insertMessage(ChatMessageModel message) {
    final roomId = controller.chatService.chatRoom.roomId;
    final content = message.toJson();

    // 対象メッセージのListが含まれるchatRoomDataの要素のindex
    final targetIndex =
        controller.chatRooms.indexWhere((element) => element.roomId == roomId);

    // 追加する対象メッセージのList
    final targetMessageList = controller.chatRooms[targetIndex].messages;
    targetMessageList.insert(
        targetMessageList.length, content.cast<String, String?>());
    controller.chatService.chatRoom.messages.refresh();
  }
}
