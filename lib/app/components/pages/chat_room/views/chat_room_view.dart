import 'package:favoritism_communication/app/components/atoms/atoms.dart'
    as atoms;
import 'package:favoritism_communication/app/components/organisms/organisms.dart';
import 'package:favoritism_communication/app/components/organisms/received_message.dart';
import 'package:favoritism_communication/app/components/organisms/sent_message.dart';
import 'package:favoritism_communication/app/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/chat_room_controller.dart';

class ChatRoomView extends GetView<ChatRoomController> {
  const ChatRoomView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(
        title:
            controller.chatService.chatRoom.roomName, //ChatMemberCard.roomName
        leading: const atoms.BackButton(),
        backgroundColor: colorChatRoomAppBarBg,
      ),
      body: Stack(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: controller.chatService.chatRoom.messages.length,
            itemBuilder: (context, index) {
              // FIXME: 仮でuid設定　Preferenceから取得？
              controller.authService.uid.val = "001";

              final senderId =
                  controller.chatService.chatRoom.messages[index]['senderId'];
              final message =
                  controller.chatService.chatRoom.messages[index]['message'];
              final profileImage = controller
                  .chatService.chatRoom.messages[index]['profileImage']
                  .toString();
              final senderName =
                  controller.chatService.chatRoom.messages[index]['senderName'];

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
          MessageBar(
            onCameraPressed: () {}, //TODO: カメラ機能は別途実装
            onPhotoPressed: () {}, //TODO: 画像追加機能は別途実装
            onSendPressed: () {}, //TODO: 送信機能は別途実装
          ),
        ],
      ),
    );
  }
}
