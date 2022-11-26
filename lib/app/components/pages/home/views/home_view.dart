import 'package:favoritism_communication/app/components/atoms/atoms.dart';
import 'package:favoritism_communication/app/components/organisms/organisms.dart';
import 'package:favoritism_communication/app/components/templates/custom_smartrefresher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart';
// import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../routes/app_pages.dart';
import '../../../organisms/search_bar.dart';
import '../controllers/home_controller.dart';
import 'dart:math' as math;

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  // ignore: avoid_init_to_null
  static var matchingDialog = null;

  @override
  Widget build(BuildContext context) {
    Follower? follower;
    Future.delayed(
        Duration.zero,
        () => {
              follower = fetchFirstMatchedFollower(),
              if (matchingDialog == null && follower != null)
                {
                  matchingDialog = Get.defaultDialog(
                      title: "",
                      middleText: "",
                      content: Column(
                        children: [
                          Image.asset('assets/images/matchingImage.jpg'),
                          Text(
                              "${follower?.userName}さんとマッチングしました。\n\nメッセージを送って\n楽しく会話しましょう",
                              textAlign: TextAlign.center,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                      actions: [
                        FractionallySizedBox(
                            widthFactor: 0.8,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                  backgroundColor: const Color(0xff0091ea)),
                              onPressed: () => {
                                Get.offAllNamed(Routes.chat),
                                matchingDialog = null
                              },
                              child: const Text("トークに移動する",
                                  style: TextStyle(color: Colors.white)),
                            )),
                        const SizedBox(height: 90)
                      ],
                      radius: 80)
                }
            });

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: NavBar(
        backgroundColor: Colors.white,
        toolbarHeight: 120,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(
                width: 320,
                height: 40,
                child: SearchBar(
                  borderRadius: 0,
                  onChanged: (text) {
                    if (text != null) {
                      controller.search(text);
                    }
                  },
                )),
            IconButton(
              icon: Badge(
                badgeContent: const Text(
                  '1',
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
                padding: const EdgeInsets.all(6),
                badgeColor: const Color.fromRGBO(223, 2, 89, 1),
                child: const Icon(
                  Icons.notifications,
                  size: 36,
                ),
              ),
              onPressed: () => Get.back<dynamic>(),
              color: Colors.grey,
            )
          ]),
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(8),
              child: Row(
                children: const [
                  CustomChip(
                    chipTitle: "マッチング候補",
                    backgroundColor: Colors.white,
                  ),
                  SizedBox(width: 8),
                  CustomChip(
                    chipTitle: "フォロー中",
                    backgroundColor: Colors.white,
                  ),
                  SizedBox(width: 8),
                  CustomChip(
                    chipTitle: "フォローされた人",
                    backgroundColor: Colors.white,
                  ),
                  SizedBox(width: 8),
                  CustomChip(
                    chipTitle: "私も好き",
                    backgroundColor: Colors.white,
                  )
                ],
              ))
        ]),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomSmartRefresher(
              refreshController: controller.refreshController,
              enablePullDown: false,
              enablePullUp: true,
              onLoading: () {
                controller.onLoading();
              },
              child: SingleChildScrollView(
                child: Obx(
                  () => controller.userCardDataList.isNotEmpty
                      ? ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
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
          ),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(MediaQuery.of(context).size.width * 0.3, 25),
                backgroundColor: const Color.fromRGBO(236, 188, 179, 1),
                foregroundColor: Colors.white,
                shape: const StadiumBorder(),
                elevation: 0,
              ),
              onPressed: () {
                // todo トップに戻る
              },
              child: const Text('TOPに戻る'),
            ),
          )
        ],
      ),
    );
  }

  Follower? fetchFirstMatchedFollower() {
    // todo マッチングしたフォロワーから最初の一人を選択
    var rand = math.Random();
    // var hasMatchedFollower = rand.nextInt(3) % 3 == 0;
    if (true) {
      //hasMatchedFollower) {
      return const Follower("001", "モンブラン");
    } else {
      return null;
    }
  }
}

class Follower {
  final String userId;
  final String userName;

  const Follower(this.userId, this.userName);
}
