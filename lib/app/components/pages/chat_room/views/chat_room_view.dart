import 'package:favoritism_communication/app/components/atoms/atoms.dart'
    as atoms;
import 'package:favoritism_communication/app/components/organisms/organisms.dart';
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
                      ? atoms.ChatBubble(
                          text: controller.chatService.follower.messages?[index]
                              ['message'],
                          isSender: true,
                        )
                      : Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            CircleAvatar(
                              //TODO:firebase接続後に動作確認
                              //profileImageがあればその画像を表示、なければグレー背景でpersonアイコンを表示
                              foregroundImage: NetworkImage(
                                controller.chatService.follower
                                        .messages?[index]['profileImage']
                                        .toString() ??
                                    '',
                              ),
                              backgroundColor: colorChatMemberCardCircleBg,
                              child: const Icon(
                                Icons.person,
                                color: colorChatMemberCardIcon,
                              ),
                            ),
                            atoms.ChatBubble(
                              text: controller.chatService.follower
                                  .messages?[index]['message'],
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
