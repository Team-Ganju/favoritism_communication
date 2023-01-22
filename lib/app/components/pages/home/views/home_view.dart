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
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorHomeBg,
      appBar: NavBar(
        backgroundColor: colorHomeAppBarBg,
        toolbarHeight: 60,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.info,
                    size: 36,
                  ),
                  onPressed: () => Get.back<dynamic>(),
                  color: colorHomeAppBarIcon,
                ),
                const Text("偏愛コミュニケーション",
                    style: TextStyle(
                      color: colorHomeAppBarTitle,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    )),
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
            )
          ],
        ),
      ),
      body: Stack(
        children: [
          NotificationListener<ScrollNotification>(
            onNotification: ((notification) {
              // スクロール位置が2000pxより下になったらTOPに戻るボタンを表示
              if (notification.metrics.pixels > 2000) {
                controller.needScrollToTop(true);
                // スクロール停止後、指定秒を経過したらボタンを非表示にする
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
                                          // フォロー処理は時間がかかる想定なのでインジケータ表示
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
                                                  // ダイアログを閉じる
                                                  Get.back();
                                                  // DashboardViewをトーク画面に切替
                                                  controller.tabService.tabIndex
                                                      .value = 1;
                                                  // トークルームに移動する
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
                                // todo NestedNavigationの実装ができたら画面遷移方法を変更する
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
                              '検索結果がありません',
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
                  child: const Text('TOPに戻る'),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Follower {
  final String userId;
  final String userName;
  final String? profileImageURL;

  const Follower(this.userId, this.userName, this.profileImageURL);
}
