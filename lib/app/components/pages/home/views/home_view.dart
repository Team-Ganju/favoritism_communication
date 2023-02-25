import 'dart:math';

import 'package:favoritism_communication/app/styles/styles.dart';
import 'package:favoritism_communication/app/components/templates/custom_smartrefresher.dart';
import 'package:favoritism_communication/app/components/atoms/atoms.dart';
import 'package:favoritism_communication/app/components/molecules/molecules.dart';
import 'package:favoritism_communication/app/components/organisms/organisms.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart';
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
                        child: GridView.count(
                          crossAxisCount: 2,
                          controller: controller.scrollController,
                          shrinkWrap: true,
                          children: List.generate(
                            100,
                            (index) {
                              return Random().nextInt(5) == 0
                                  ? const Center(
                                      child: UserListInfoItem(
                                          label: "偏愛マップを作成した気の合う人を見つけよう"),
                                    )
                                  : Center(
                                      child: UserListProfileItem(
                                        name: "田中 太郎",
                                        avatorUrl: null,
                                        commonList: getRandomCommonList(),
                                        selfIntroduction: "自己紹介文",
                                      ),
                                    );
                            },
                          ),
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

List<String> getRandomCommonList() {
  int rand = Random().nextInt(4) + 1;
  switch (rand) {
    case 1:
      return [""];
    case 2:
      return ["", ""];
    case 3:
      return ["", "", ""];
    default:
      return ["", "", "", ""];
  }
}

class Follower {
  final String userId;
  final String userName;
  final String? profileImageURL;

  const Follower(this.userId, this.userName, this.profileImageURL);
}
