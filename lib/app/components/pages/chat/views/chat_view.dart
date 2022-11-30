import 'package:favoritism_communication/app/components/organisms/nav_bar.dart';
import 'package:favoritism_communication/app/components/organisms/talk_member_card.dart';
import 'package:favoritism_communication/app/components/atoms/atoms.dart';
import 'package:favoritism_communication/app/components/pages/chat/controllers/chat_controller.dart';
import 'package:favoritism_communication/app/components/pages/chat/talk_member_card_model_model.dart';
import 'package:favoritism_communication/app/components/pages/home/views/home_view.dart';
import 'package:favoritism_communication/app/components/templates/templates.dart';
import 'package:favoritism_communication/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                        backgroundColor: controller.isGroupTalk.value
                            ? colorActionChipGroupBgIfIsGroupTalk
                            : colorActionChipGroupBgIfIsNotGroupTalk,
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        onPressed: () {
                          controller.switchTalkPartner();
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
                        backgroundColor: controller.isGroupTalk.value
                            ? colorActionChipPairTalkBgIfIsGroupTalk
                            : colorActionChipPairTalkBgIfIsNotGroupTalk,
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
              () => controller.isGroupTalk.value
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
                        itemCount: controller.provider.groupTalks.length,
                        itemBuilder: (context, index) {
                          final TalkMemberCardModel group =
                              controller.provider.groupTalks[index];
                          return TalkMemberCard(
                            onTap: () {
                              controller.chatService.follower = Follower(
                                index.toString(),
                                group.roomName ?? '',
                                group.profileImageURL,
                              );
                              Get.toNamed(Routes.talkRoom);
                            },
                            roomName: group.roomName ?? '',
                            mostRecentMessage: group.mostRecentMessage ?? '',
                            profileImageURL: group.profileImageURL,
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
                        itemCount: controller.provider.individualTalks.length,
                        itemBuilder: (context, index) {
                          final TalkMemberCardModel individual =
                              controller.provider.individualTalks[index];
                          return TalkMemberCard(
                            onTap: () {
                              controller.chatService.follower = Follower(
                                index.toString(),
                                individual.roomName ?? '',
                                individual.profileImageURL,
                              );
                              Get.toNamed(Routes.talkRoom);
                            },
                            roomName: individual.roomName ?? '',
                            mostRecentMessage:
                                individual.mostRecentMessage ?? '',
                            profileImageURL: individual.profileImageURL,
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
