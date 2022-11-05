import 'package:favoritism_communication/app/modules/components/atoms/atoms.dart';
import 'package:favoritism_communication/app/modules/components/nav_bar.dart';
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
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
                          children: const [
                            // fixme1: あとでatomic designでコンポーネント化する。
                            // fixme2: Firestorageで画像が取得できるようになったら修正
                            CircleAvatar(
                              backgroundColor: Colors.grey,
                              child: Icon(
                                Icons.person,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 15),
                            Text(
                              // fixme: ユーザ名がFiresstoreから取れるようになったら修正
                              'ユーザネーム',
                              style: TextStyle(fontWeight: FontWeight.bold),
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
                          children: const [
                            CustomChip(
                              chipTitle: '観光地',
                              backgroundColor: Color.fromRGBO(255, 250, 205, 1),
                            ),
                            CustomChip(
                              chipTitle: '映画',
                              backgroundColor: Color.fromRGBO(255, 250, 205, 1),
                            ),
                            CustomChip(
                              chipTitle: '本',
                              backgroundColor: Color.fromRGBO(255, 250, 205, 1),
                            ),
                            CustomChip(
                              chipTitle: '音楽',
                              backgroundColor: Color.fromRGBO(255, 250, 205, 1),
                            ),
                            CustomChip(
                              chipTitle: 'ご飯',
                              backgroundColor: Color.fromRGBO(255, 250, 205, 1),
                            ),
                            CustomChip(
                              chipTitle: 'スポーツ',
                              backgroundColor: Color.fromRGBO(255, 250, 205, 1),
                            ),
                            CustomChip(
                              chipTitle: 'ホゲホゲ',
                              backgroundColor: Color.fromRGBO(255, 250, 205, 1),
                            ),
                            CustomChip(
                              chipTitle: 'カテゴリは10個まで',
                              backgroundColor: Color.fromRGBO(255, 250, 205, 1),
                            ),
                            CustomChip(
                              chipTitle: 'これくらいの長さまでは書いてOK。20字程度。',
                              backgroundColor: Color.fromRGBO(255, 250, 205, 1),
                            ),
                            CustomChip(
                              chipTitle: 'その他はユーザが決めれる',
                              backgroundColor: Color.fromRGBO(255, 250, 205, 1),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
