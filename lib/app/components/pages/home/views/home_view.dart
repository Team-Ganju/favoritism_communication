import 'package:favoritism_communication/app/components/atoms/atoms.dart';
import 'package:favoritism_communication/app/utils/dialog_utils.dart';
import 'package:favoritism_communication/app/styles/styles.dart';
import 'package:favoritism_communication/app/components/organisms/organisms.dart';
import 'package:favoritism_communication/app/components/templates/custom_smartrefresher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart';
import '../../../../routes/app_pages.dart';
import '../../../atoms/tab_button.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorHomeBg,
      appBar: NavBar(
        backgroundColor: colorHomeAppBarBg,
        toolbarHeight: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    width: 320,
                    height: 40,
                    child: SearchBar(
                      onChanged: (text) {
                        if (text != null) {
                          controller.search(text);
                        }
                      },
                    ),
                  ),
                ),
                IconButton(
                  icon: Badge(
                    badgeContent: const Text(
                      '1',
                      style: TextStyle(
                          fontSize: 14, color: colorHomeAppBarIconBadgeText),
                    ),
                    padding: const EdgeInsets.all(6),
                    badgeColor: colorHomeAppBarIconBadgeBg,
                    child: const Icon(
                      Icons.notifications,
                      size: 36,
                    ),
                  ),
                  onPressed: () => Get.back<dynamic>(),
                  color: colorHomeAppBarIcon,
                )
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(8),
              child: Obx(
                () => Row(
                  children: buildTabButtons(controller.getTabList()),
                ),
              ),
            )
          ],
        ),
      ),
      body: Stack(
        children: [
          NotificationListener<ScrollNotification>(
            onNotification: ((notification) {
              // ????????????????????????2000px????????????????????????TOP???????????????????????????
              if (notification.metrics.pixels > 2000) {
                controller.needScrollToTop(true);
                // ????????????????????????????????????????????????????????????????????????????????????
                Future.delayed(
                  const Duration(seconds: 3),
                  () => {controller.needScrollToTop(false)},
                );
              } else {
                controller.needScrollToTop(false);
              }
              return false;
            }),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Obx(
                () => controller.userCardDataList.isNotEmpty
                    ? CustomSmartRefresher(
                        refreshController: controller.refreshController,
                        scrollController: controller.scrollController,
                        enablePullDown: false,
                        enablePullUp: true,
                        onLoading: () {
                          controller.onLoading();
                        },
                        child: ListView.separated(
                          controller: controller.scrollController,
                          shrinkWrap: true,
                          itemCount: controller.userCardDataList.length,
                          itemBuilder: (context, index) {
                            final UserCardData userCardData =
                                controller.userCardDataList[index];
                            return UserCard(
                              userCardData: userCardData,
                              followAction: Obx(
                                () => controller
                                        .userCardDataList[index].isFollowed
                                    ? FollowButton(
                                        onPressed: () {
                                          debugPrint("scrollToTop!!");
                                          controller.scrollController.jumpTo(0);
                                          controller.unFollow(userCardData);
                                        },
                                        foregroundColor:
                                            colorUserCardFollowButtonFgAsFollowed,
                                        backgroundColor:
                                            colorUserCardFollowButtonBgAsFollowed,
                                        isFollowed: userCardData.isFollowed,
                                      )
                                    : FollowButton(
                                        onPressed: () {
                                          // ??????????????????????????????????????????????????????????????????????????????
                                          EasyLoading.show();
                                          controller.follow(userCardData);
                                          controller.chatService.follower =
                                              Follower(
                                            index.toString(),
                                            userCardData.userName,
                                            null,
                                          );
                                          Future.delayed(
                                              const Duration(seconds: 2),
                                              () => EasyLoading.dismiss()).then(
                                            (value) {
                                              DialogUtils.dialog(
                                                () {
                                                  // ???????????????????????????
                                                  Get.back();
                                                  // DashboardView???????????????????????????
                                                  controller.tabService.tabIndex
                                                      .value = 1;
                                                  // ?????????????????????????????????
                                                  Get.toNamed(Routes.talkRoom);
                                                },
                                                controller.chatService.follower
                                                    .userName,
                                              );
                                            },
                                          );
                                        },
                                        foregroundColor:
                                            colorUserCardFollowButtonFgAsUnfollowed,
                                        backgroundColor:
                                            colorUserCardFollowButtonBgAsUnfollowed,
                                        isFollowed: userCardData.isFollowed,
                                      ),
                              ),
                              onTapped: () {
                                // todo NestedNavigation?????????????????????????????????????????????????????????
                                Get.toNamed(Routes.profile,
                                    arguments: [userCardData.userName]);
                              },
                            );
                          },
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 10),
                        ),
                      )
                    : Column(
                        children: const [
                          SizedBox(height: 30),
                          Center(
                            child: Text(
                              '??????????????????????????????',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          ),
          Obx(
            () => Visibility(
              visible: controller.needScrollToTop.value,
              child: Positioned(
                bottom: 25,
                left: Get.width / 3,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(Get.width * 0.3, 25),
                    foregroundColor: colorReturnToTopButtonFg,
                    backgroundColor: colorReturnToTopButtonBg,
                    shape: const StadiumBorder(),
                    elevation: 0,
                  ),
                  onPressed: () {
                    controller.scrollController.jumpTo(0);
                  },
                  child: const Text('TOP?????????'),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

List<Widget> buildTabButtons(List<TabData> tabDataList) {
  List<Widget> list = [];
  for (var i = 0; i < tabDataList.length; i++) {
    list.add(
      TabButton(
        chipTitle: tabDataList[i].title,
        isEnable: tabDataList[i].isEnable,
        onPressed: () => tabDataList[i].onPressed(tabDataList[i]),
      ),
    );
    if (i != tabDataList.length - 1) {
      list.add(const SizedBox(width: 8));
    }
  }
  return list;
}

class Follower {
  final String userId;
  final String userName;
  final String? profileImageURL;

  const Follower(this.userId, this.userName, this.profileImageURL);
}
