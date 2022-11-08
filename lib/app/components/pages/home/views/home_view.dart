import 'package:favoritism_communication/app/components/organisms/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../../../molecules/user_card.dart';
import 'dart:math' as math;

class HomeView extends GetView<HomeController> {
  static const tempCategoryNameList = ['観光地', '映画', '本', '音楽', 'ご飯', 'スポーツ', 'ホゲホゲ', 'カテゴリは10個まで', 'これくらいの長さまでは書いてOK。20字程度。', 'その他はユーザが決めれる'];
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // todo 外部からユーザデータを取得
    var userName = ['Kaz', 'Motaken', 'Raiki', 'Nisshy'];
    var userCardList = userName.map((item) {
      return UserCard(
        context,
        UserCardData(
          item,
          getRandomCategoryList().map((item) {
            return CategoryData(item, const Color.fromRGBO(255, 250, 205, 1));
          }).toList()
        ),
        controller
      );
    }).toList();

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: const NavBar(
        backgroundColor: Colors.pinkAccent,
        title: 'ホーム',
      ),
      body: ListView(
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 8),
          children: userCardList
        ),
      );
  }
}

List<String> getRandomCategoryList() {
  // ランダムなカテゴリを返す
  var categories = ['観光地', '映画', '本', '音楽', 'ご飯', 'スポーツ', 'ホゲホゲ', 'カテゴリは10個まで', 'これくらいの長さまでは書いてOK。20字程度。', 'その他はユーザが決めれる'];
  var indexList = [];
  for (var i = 0; i < categories.length; i++) {
    indexList.add(i);
  }
  var rand = math.Random();
  for (var i = 0; i < categories.length; i++) {
    var first = rand.nextInt(categories.length);
    var second = rand.nextInt(categories.length);
    var temp = indexList[first];
    indexList[first] = indexList[second];
    indexList[second] = temp;
  }
  return indexList.map((item) {
    return categories[item];
  }).toList();
}
