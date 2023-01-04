import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/demo_app_pages.dart';
import '../controllers/demo_home_controller.dart';
import '../../../components/atoms/menu_list_tile.dart';

class DemoHomeView extends GetView<DemoHomeController> {
  const DemoHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                'ユーザID:\n${controller.authService.uid.val}',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50.0, left: 10.0, bottom: 10.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'ユーザー情報',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                MenuListTile(title: 'プロフィール情報登録', isTop: true,
                  onTap: () => { Get.toNamed(DemoRoutes.demoProfileCreate) },),
                MenuListTile(title: 'プロフィール情報閲覧',
                  onTap: () => { Get.toNamed(DemoRoutes.demoProfile) },),
                MenuListTile(title: 'プロフィール情報編集',
                  onTap: () => { Get.toNamed(DemoRoutes.demoProfileUpdate) },),
                MenuListTile(title: 'プロフィール削除', textColor: Colors.red,
                  onTap: () => { Get.toNamed(DemoRoutes.demoProfileDelete) },),
              ],
            ),
          ),
        ],
      ),

    );
  }
}
