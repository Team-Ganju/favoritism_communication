import 'package:favoritism_communication/app/components/organisms/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../../../molecules/user_card.dart';
import 'dart:math' as math;

class HomeView extends GetView<HomeController> {
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
            return CategoryData(item, getRandomColor());
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
      body: NotificationListener<ScrollNotification>(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 8),
          children: userCardList
        ),
        onNotification: (ScrollNotification notification) {
            print('OverscrollNotification:${notification is OverscrollNotification}');
            print('maxScrollExtent:${notification.metrics.maxScrollExtent}');
            print('pixels:${notification.metrics.pixels}');
            print('outOfRange:${notification.metrics.outOfRange}');

            return false;
        }
      ),
    );
  }
}

List<String> getRandomCategoryList() {
  var categories = ['観光地', '映画', '本', '音楽', 'ご飯', 'スポーツ', 'ホゲホゲ', 'カテゴリは10個まで', 'これくらいの長さまでは書いてOK。20字程度。', 'その他はユーザが決めれる'];
  var indexList = [];
  var rand = math.Random();
  var categoryNum = rand.nextInt(categories.length);
  categoryNum = categoryNum < 5 ? 5 : categoryNum;
  for (var i = 0; i < categoryNum; i++) {
    indexList.add(i);
  }
  for (var i = 0; i < categoryNum; i++) {
    var first = rand.nextInt(categoryNum);
    var second = rand.nextInt(categoryNum);
    var temp = indexList[first];
    indexList[first] = indexList[second];
    indexList[second] = temp;
  }
  return indexList.map((item) {
    return categories[item];
  }).toList();
}

Color getRandomColor() {
  var rand = math.Random();
  var red = rand.nextInt(100) + 155;
  var green = rand.nextInt(100) + 155;
  var blue = rand.nextInt(100) + 155;
  return Color.fromRGBO(red, green, blue, 1);
}
