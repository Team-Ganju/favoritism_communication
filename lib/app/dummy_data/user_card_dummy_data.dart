import 'package:flutter/material.dart';
import '../components/organisms/user_card.dart';
import 'dart:math' as math;

/// 後でクラスとして整理したい
// todo 外部からユーザデータを取得
List<Map<String, dynamic>> userData = [
  {
    'name': 'Kaz',
    'image': null,
    'isFollowed': false,
  },
  {
    'name': 'Motaken',
    'image': null,
    'isFollowed': false,
  },
  {
    'name': 'Raiki',
    'image': null,
    'isFollowed': false,
  },
  {
    'name': 'Nisshy',
    'image': null,
    'isFollowed': false,
  },
];
List<UserCardData> userCardList = userData.map((item) {
  return UserCardData(
    item['name'],
    getRandomCategoryList().map((item) {
      return CategoryData(item, getRandomColor());
    }).toList(),
    item['image'],
    item['isFollowed'],
  );
}).toList();

List<String> getRandomCategoryList() {
  var categories = [
    '観光地',
    '映画',
    '本',
    '音楽',
    'ご飯',
    'スポーツ',
    'ホゲホゲ',
    'カテゴリは10個まで',
    'これくらいの長さまでは書いてOK。20字程度。',
    'その他はユーザが決めれる',
  ];
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
