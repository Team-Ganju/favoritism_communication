import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:favoritism_communication/app/components/atoms/atoms.dart'
    as atoms;
import 'package:favoritism_communication/app/components/organisms/organisms.dart';
import 'package:favoritism_communication/app/components/organisms/received_message.dart';
import 'package:favoritism_communication/app/components/organisms/sent_message.dart';
import 'package:favoritism_communication/app/models/chat_message_model.dart';
import 'package:favoritism_communication/app/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/chat_room_controller.dart';

class ChatRoomView extends GetView<ChatRoomController> {
  ChatRoomView({
    Key? key,
  }) : super(key: key);

  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // FIXME: 仮でuid設定　Preferenceから取得？
    controller.authService.uid.val = "001";

    final roomName = controller.chatService.chatRoom.roomName;
    final messages = controller.chatService.chatRoom.messages;

    return Scaffold(
      appBar: NavBar(
        title: roomName,
        leading: const atoms.BackButton(),
        backgroundColor: colorChatRoomAppBarBg,
      ),
      body: Stack(
        children: [
          ListView.builder(
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
          MessageBar(
            onChanged: (value) => _onChanged(value),
            onCameraPressed: () {}, //TODO: カメラ機能は別途実装
            onPhotoPressed: () {}, //TODO: 画像追加機能は別途実装
            onSendPressed: _onSendPressed, //TODO: 送信機能は別途実装
          ),
        ],
      ),
    );
  }

  void _onChanged(String? value) {
    textController.text = value ?? '';
  }

  void _onSendPressed() {
    final senderId = controller.authService.uid.val;
    final senderName = controller.authService.userName.val;
    final profileImage = controller.authService.profileImage.val;
    final messageText = textController.text;

    final message = ChatMessageModel(
      senderId: senderId,
      senderName: senderName,
      profileImage: profileImage,
      media: null, // TODO: メディア追加機能作成時にテキストと画像を同時に送れるようにする？
      message: messageText,
      createdAt: FieldValue.serverTimestamp(),
    );

    _insertMessage(message);
  }

  void _insertMessage(ChatMessageModel message) async {
    final roomId = controller.chatService.chatRoom.roomId;
    final content = message.toJson();

    await FirebaseFirestore.instance
        .collection('chatRooms')
        .doc(roomId)
        .update({
      'message': FieldValue.arrayUnion([content]),
    });
  }
}
