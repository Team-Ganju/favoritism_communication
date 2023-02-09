import 'package:favoritism_communication/app/components/organisms/nav_bar.dart';
import 'package:favoritism_communication/app/components/organisms/chat_member_card.dart';
import 'package:favoritism_communication/app/components/atoms/atoms.dart';
import 'package:favoritism_communication/app/components/pages/chat/controllers/chat_controller.dart';
import 'package:favoritism_communication/app/components/pages/home/views/home_view.dart';
import 'package:favoritism_communication/app/components/templates/templates.dart';
import 'package:favoritism_communication/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../models/chat_room_model.dart';
import '../../../../styles/styles.dart';

class ChatView extends GetView<ChatController> {
  const ChatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(
        title: 'トーク',
        backgroundColor: colorChatViewBg,
        trailing: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.person_add_alt_1,
              size: 30,
            ),
            color: colorChatViewIcon,
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
                border: Border.all(color: colorChatViewBodyBorder),
                borderRadius: BorderRadius.circular(45),
                color: colorChatViewBodyBg,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Obx(() => CustomActionChip(
                        avatar: const Icon(
                          Icons.groups,
                          size: 26,
                          color: colorActionChipIcon,
                        ),
                        label: const Text('グループ'),
                        labelPadding:
                            const EdgeInsets.symmetric(horizontal: 13.0),
                        side: BorderSide.none,
                        backgroundColor: controller.isGroupChat.value
                            ? colorActionChipGroupBgIfIsGroupChat
                            : colorActionChipGroupBgIfIsNotGroupChat,
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        onPressed: () {
                          controller.switchChatPartner();
                        },
                      )),
                  Obx(() => CustomActionChip(
                        avatar: const Icon(
                          Icons.person,
                          color: colorActionChipGroupIcon,
                        ),
                        label: const Text('ペアトーク'),
                        labelPadding:
                            const EdgeInsets.symmetric(horizontal: 4.0),
                        side: BorderSide.none,
                        backgroundColor: controller.isGroupChat.value
                            ? colorActionChipPairChatBgIfIsGroupChat
                            : colorActionChipPairChatBgIfIsNotGroupChat,
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        onPressed: () {
                          controller.switchChatPartner();
                        },
                      )),
                ],
              ),
            ),
          ),
          Expanded(
            child: Obx(
              () => controller.isGroupChat.value
                  ? CustomSmartRefresher(
                      refreshController:
                          controller.refreshControllerInGroupList,
                      enablePullDown: false,
                      enablePullUp: false,
                      onLoading: () {
                        // fixme: スクロール処理を後で書く
                      },
                      onRefresh: () {
                        // fixme: スクロール処理を後で書く
                        controller.onRefreshInGroupList();
                      },
                      child: ListView.builder(
                        itemCount: controller.provider.groupChats.length,
                        itemBuilder: (context, index) {
                          final ChatRoomModel group =
                              controller.provider.groupChats[index];
                          return ChatMemberCard(
                            onTap: () {
                              controller.chatService.follower = Follower(
                                index.toString(),
                                group.roomName ?? '',
                                group.profileImage,
                                group.messages,
                              );
                              Get.toNamed(Routes.chatRoom);
                            },
                            roomName: group.roomName ?? '',
                            lastMessage: group.lastMessage ?? '',
                            profileImage: group.profileImage,
                          );
                        },
                      ),
                    )
                  : CustomSmartRefresher(
                      refreshController: controller.refreshControllerInPairList,
                      enablePullDown: false,
                      enablePullUp: false,
                      onLoading: () {
                        // fixme: スクロール処理を後で書く
                      },
                      onRefresh: () {
                        // fixme: スクロール処理を後で書く
                        controller.onRefreshInPairList();
                      },
                      child: ListView.builder(
                        itemCount: controller.provider.individualChats.length,
                        itemBuilder: (context, index) {
                          final ChatRoomModel individual =
                              controller.provider.individualChats[index];
                          return ChatMemberCard(
                            onTap: () {
                              controller.chatService.follower = Follower(
                                index.toString(),
                                individual.roomName ?? '',
                                individual.profileImage,
                                individual.messages,
                              );
                              Get.toNamed(Routes.chatRoom);
                            },
                            roomName: individual.roomName ?? '',
                            lastMessage: individual.lastMessage ?? '',
                            profileImage: individual.profileImage,
                          );
                        },
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
