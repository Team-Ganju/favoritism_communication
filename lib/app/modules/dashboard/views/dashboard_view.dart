import 'package:favoritism_communication/app/modules/chat/views/chat_view.dart';
import 'package:favoritism_communication/app/modules/home/views/home_view.dart';
import 'package:favoritism_communication/app/modules/mypage/views/mypage_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: controller.tabIndex.value,
          children: const [
            HomeView(),
            ChatView(),
            MypageView(),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          onTap: controller.changeIndex,
          currentIndex: controller.tabIndex.value,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.pinkAccent,
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: 'ホーム',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.chat_bubble),
              label: 'トーク',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person),
              label: 'プロフィール',
            )
          ],
        ),
      ),
    );
  }
}