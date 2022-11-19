import 'package:favoritism_communication/app/components/atoms/atoms.dart';
import 'package:favoritism_communication/app/components/organisms/organisms.dart';
import 'package:favoritism_communication/app/components/pages/dashboard/controllers/dashboard_controller.dart';
import 'package:favoritism_communication/app/components/pages/mypage/controllers/mypage_controller.dart';
import 'package:favoritism_communication/app/components/templates/custom_smartrefresher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(controller, tag: 'HomeController');
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: const NavBar(
        backgroundColor: Colors.pinkAccent,
        title: 'ホーム',
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
                            return GestureDetector(
                                onTap: () {
                                  var dashBoardController =
                                      Get.find<DashboardController>(
                                          tag: 'DashboardController');
                                  dashBoardController.changeIndex(2);
                                  controller.select(userCardData.userName);
                                  var myPageController =
                                      Get.find<MypageController>(
                                          tag: 'MypageController');
                                  myPageController
                                      .setUserName(userCardData.userName);
                                  Get.put(controller, tag: 'HomeController');
                                },
                                child: UserCard(
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
                                ));
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
}
