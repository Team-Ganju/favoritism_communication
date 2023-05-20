import 'dart:math';

import 'package:favoritism_communication/app/dummy_data/common_profile_dummy_data.dart';
import 'package:favoritism_communication/app/styles/styles.dart';
import 'package:favoritism_communication/app/components/templates/custom_smartrefresher.dart';
import 'package:favoritism_communication/app/components/atoms/atoms.dart';
import 'package:favoritism_communication/app/components/organisms/organisms.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart' as badges;
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
                  icon: const badges.Badge(
                    badgeContent: Text(
                      '1',
                      style: TextStyle(
                          fontSize: 14, color: colorHomeAppBarIconBadgeText),
                    ),
                    child: Icon(
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
                        child: CustomScrollView(
                          slivers: <Widget>[
                            SliverGrid(
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.9,
                              ),
                              delegate: SliverChildBuilderDelegate(
                                (BuildContext context, int index) {
                                  return Random().nextInt(5) == 0
                                  ? const Center(
                                      child: UserListInfoItem(
                                          label: "偏愛マップを作成した気の合う人を見つけよう"),
                                    )
                                  : Center(
                                      child: dummyUserListProfileItems[
                                          Random().nextInt(4)]);
                                },
                                childCount: 100,
                              ),
                            ),
                          ]
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
