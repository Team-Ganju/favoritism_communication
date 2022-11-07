import 'package:favoritism_communication/app/components/organisms/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../../../molecules/user_card.dart';

class HomeView extends GetView<HomeController> {
  static const tempCategoryNameList = ['観光地', '映画', '本', '音楽', 'ご飯', 'スポーツ', 'ホゲホゲ', 'カテゴリは10個まで', 'これくらいの長さまでは書いてOK。20字程度。', 'その他はユーザが決めれる'];
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // todo 外部からユーザデータを取得
    List<CategoryData> tempCategoryList = [];
    for (var item in tempCategoryNameList) {
      tempCategoryList.add(CategoryData(item, const Color.fromRGBO(255, 250, 205, 1)));
    }
    var tempUserCardData = UserCardData("ユーザネーム", tempCategoryList);

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: const NavBar(
        backgroundColor: Colors.pinkAccent,
        title: 'ホーム',
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UserCard(context, tempUserCardData, controller),
            UserCard(context, tempUserCardData, controller),
            UserCard(context, tempUserCardData, controller)
          ],
        ),
      ),
    );
  }
}
