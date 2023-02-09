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
            controller.chatService.follower.userName, //ChatMemberCard.roomName
        leading: const atoms.BackButton(),
        backgroundColor: colorChatRoomAppBarBg,
      ),
      body: Stack(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: controller.chatService.follower.messages?.length ?? 0,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  if (index == 0)
                    const SizedBox(
                      height: 20,
                    ),
                  controller.chatService.follower.messages?[index]['isSender']
                      ? SentMessage(
                          text: controller.chatService.follower.messages?[index]
                              ['message'],
                        )
                      : ReceivedMessage(
                          profileImage: controller.chatService.follower
                              .messages?[index]['profileImage']
                              .toString(),
                          senderName: controller.chatService.follower
                              .messages?[index]['userName'],
                          text: controller.chatService.follower.messages?[index]
                              ['message'],
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
