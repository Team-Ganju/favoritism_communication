import 'package:favoritism_communication/app/components/atoms/atoms.dart';
import 'package:favoritism_communication/app/components/organisms/organisms.dart';
import 'package:favoritism_communication/app/components/templates/custom_smartrefresher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: const NavBar(
        backgroundColor: Colors.pinkAccent,
        title: 'ホーム',
      ),
      body: Stack(
        children: [
          NotificationListener<ScrollNotification>(
            onNotification: ((notification) {
              // スクロール位置が2000pxより下になったらTOPに戻るボタンを表示
              debugPrint("offset ${notification.metrics.pixels}");
              if (notification.metrics.pixels > 2000) {
                controller.needScrollToTop(true);
                // スクロール停止後、2秒経過したらボタンを非表示にする
                Future.delayed(const Duration(seconds: 3),
                    () => {controller.needScrollToTop(false)});
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
                                        backgroundColor: Colors.blueAccent,
                                        foregroundColor: Colors.white,
                                        isFollowed: userCardData.isFollowed,
                                      )
                                    : FollowButton(
                                        onPressed: () {
                                          controller.follow(userCardData);
                                        },
                                        backgroundColor: Colors.white,
                                        foregroundColor: Colors.blueAccent,
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
                        ))
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
          Obx(() => Visibility(
              visible: controller.needScrollToTop.value,
              child: Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize:
                        Size(MediaQuery.of(context).size.width * 0.3, 25),
                    backgroundColor: const Color.fromRGBO(236, 188, 179, 1),
                    foregroundColor: Colors.white,
                    shape: const StadiumBorder(),
                    elevation: 0,
                  ),
                  onPressed: () {
                    // debugPrint(
                    //     "scrollTo ${controller.scrollController.position.pixels}");
                    controller.scrollController.jumpTo(0);
                    // controller.scrollController.animateTo(0,
                    //     duration: const Duration(seconds: 1),
                    //     curve: Curves.linear);
                  },
                  child: const Text('TOPに戻る'),
                ),
              )))
        ],
      ),
    );
  }
}
