import 'package:favoritism_communication/app/components/atoms/atoms.dart';
import 'package:favoritism_communication/app/components/organisms/organisms.dart';
import 'package:favoritism_communication/app/dummy_data/user_card_dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      body: NotificationListener<ScrollNotification>(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.separated(
            itemCount: userCardList.length,
            itemBuilder: (context, index) {
              final UserCardData userCardData =
                  controller.userCardDataList[index];
              return CustomUserCard(
                userCardData: userCardData,
                followAction: Obx(
                  () => controller.userCardDataList[index].isFollowed
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
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 10),
          ),
        ),
        onNotification: (ScrollNotification notification) {
          debugPrint(
              'OverscrollNotification:${notification is OverscrollNotification}');
          debugPrint('maxScrollExtent:${notification.metrics.maxScrollExtent}');
          debugPrint('pixels:${notification.metrics.pixels}');
          debugPrint('outOfRange:${notification.metrics.outOfRange}');

          return false;
        },
      ),
    );
  }
}
