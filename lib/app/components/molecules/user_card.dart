import 'package:favoritism_communication/app/components/atoms/atoms.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../pages/home/controllers/home_controller.dart';

class UserCard extends Card {
  UserCard(
    BuildContext context, UserCardData userCardData, HomeController controller)
      : super(
         shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
                side: BorderSide(
                  color: Colors.grey.shade300,
                ),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              elevation: 0,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            // fixme1: あとでatomic designでコンポーネント化する。
                            // fixme2: Firestorageで画像が取得できるようになったら修正
                            const CircleAvatar(
                              backgroundColor: Colors.grey,
                              child: Icon(
                                Icons.person,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 15),
                            Text(
                              // fixme: ユーザ名がFiresstoreから取れるようになったら修正
                              userCardData.userName,
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        // todo: フォロ-ボタンをatomic designにしたい。あとでコンポーネント化考える
                        Obx(
                          () => controller.isFollowed.value
                              ? ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    fixedSize: Size(
                                        MediaQuery.of(context).size.width * 0.3,
                                        25),
                                    backgroundColor: Colors.blueAccent,
                                    foregroundColor: Colors.white,
                                    shape: const StadiumBorder(),
                                    elevation: 0,
                                  ),
                                  onPressed: () {
                                    controller.unFollow();
                                  },
                                  child: const Text('フォロー中'),
                                )
                              : ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    fixedSize: Size(
                                        MediaQuery.of(context).size.width * 0.3,
                                        25),
                                    backgroundColor: Colors.white,
                                    foregroundColor: Colors.blueAccent,
                                    shape: const StadiumBorder(
                                        side: BorderSide(
                                            color: Colors.blueAccent)),
                                    elevation: 0,
                                  ),
                                  onPressed: () {
                                    controller.follow();
                                  },
                                  child: const Text('フォローする'),
                                ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, bottom: 15.0),
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '好きなカテゴリ',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        // fixme: あとでatomic design適用する(moleculesかOrganisms)
                        Wrap(
                          runSpacing: 4.0,
                          spacing: 4.0,
                          children: userCardData.categories.map((item) {
                            return CustomChip(chipTitle: item.categoryName, backgroundColor: item.categoryColor);
                          }).toList()
                        )
                      ],
                    ),
                  ),
                ],
              )
      );
}

class CategoryData {
  final String categoryName;
  final Color categoryColor;

  const CategoryData(
    this.categoryName,
    this.categoryColor
  );
}

class UserCardData {
  final String userName;
  final List<CategoryData> categories;

  const UserCardData(
    this.userName,
    this.categories
  );
}
