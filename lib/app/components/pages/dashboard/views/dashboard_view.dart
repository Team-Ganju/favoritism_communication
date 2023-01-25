import 'package:favoritism_communication/app/components/pages/tab_root/tab_root_view.dart';
import 'package:favoritism_communication/app/routes/app_pages.dart';
import 'package:favoritism_communication/app/styles/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/dashboard_controller.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            child: Obx(
              () => IndexedStack(
                index: controller.tabService.tabIndex.value,
                children: const [
                  TabRootView(initialRoot: Routes.home),
                  TabRootView(initialRoot: Routes.search),
                  TabRootView(initialRoot: Routes.chat),
                  TabRootView(initialRoot: Routes.mypage)
                ],
              ),
            ),
          ),
          Obx(
            () => Visibility(
              visible: controller.isShowAd.value,
              child: Container(
                width: controller.getAd()?.size.width.toDouble(),
                height: 72.0,
                alignment: Alignment.center,
                child: controller.isShowAd.value
                    ? AdWidget(ad: controller.getAd()!)
                    : const Spacer(),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          onTap: controller.tabService.changeIndex,
          currentIndex: controller.tabService.tabIndex.value,
          unselectedItemColor: colorDashboardUnselectedItem,
          selectedItemColor: colorDashboardSelectedItem,
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
