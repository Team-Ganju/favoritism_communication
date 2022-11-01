import 'package:favoritism_communication/app/modules/components/nav_bar.dart';
import 'package:flutter/cupertino.dart';
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
              margin: EdgeInsets.symmetric(horizontal: 20),
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
                            // fixme: あとでコンポーネント化する
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
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.blueAccent,
                            shape: const StadiumBorder(
                                side: BorderSide(color: Colors.blueAccent)),
                            elevation: 0,
                          ),
                          onPressed: () {},
                          child: Text('フォローする'),
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
                        Wrap(
                          runSpacing: 4.0,
                          spacing: 4.0,
                          children: [
                            Chip(
                              label: Text('旅行'),
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              backgroundColor:
                                  Color.fromARGB(255, 245, 245, 222),
                            ),
                            Chip(
                              label: Text('映画'),
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              backgroundColor:
                                  Color.fromARGB(255, 245, 245, 222),
                            ),
                            Chip(
                              label: Text('漫画'),
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              backgroundColor:
                                  Color.fromARGB(255, 245, 245, 222),
                            ),
                            Chip(
                              label: Text('漫画'),
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              backgroundColor:
                                  Color.fromARGB(255, 245, 245, 222),
                            ),
                            Chip(
                              label: Text('漫画'),
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              backgroundColor:
                                  Color.fromARGB(255, 245, 245, 222),
                            ),
                            Chip(
                              label: Text('漫画'),
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              backgroundColor:
                                  Color.fromARGB(255, 245, 245, 222),
                            ),
                            Chip(
                              label: Text('漫画'),
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              backgroundColor:
                                  Color.fromARGB(255, 245, 245, 222),
                            ),
                            Chip(
                              label: Text('漫画'),
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              backgroundColor:
                                  Color.fromARGB(255, 245, 245, 222),
                            ),
                            Chip(
                              label: Text('ホゲホゲホゲ。これくらいの長さまでは書いてOK'),
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              backgroundColor:
                                  Color.fromARGB(255, 245, 245, 222),
                            ),
                            Chip(
                              label: Text('その他はユーザが決めれる'),
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              backgroundColor:
                                  Color.fromARGB(255, 245, 245, 222),
                            ),
                            Chip(
                              label: Text('ホゲホゲホゲホゲ'),
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              backgroundColor:
                                  Color.fromARGB(255, 245, 245, 222),
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
