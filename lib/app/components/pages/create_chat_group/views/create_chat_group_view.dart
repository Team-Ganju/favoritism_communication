import 'package:flutter/material.dart';
import 'package:favoritism_communication/app/components/organisms/nav_bar.dart';
import 'package:favoritism_communication/app/components/atoms/atoms.dart';

import 'package:get/get.dart';

import '../controllers/create_chat_group_controller.dart';

//FIXME: firebaseからデータを取得するようになったらは削除
List<String> searchedTargetList = [
  'Aさん',
  'ABさん',
  'ABCさん',
  'Bさん',
  'BAさん',
  'BACさん',
  'Cさん'
];

class CreateChatGroupView extends GetView<CreateChatGroupController> {
  const CreateChatGroupView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NavBar(
        title: '友達を選択',
        backgroundColor: Colors.pink,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SearchBar(searchTarget: searchedTargetList),
          ),
          const Expanded(
            child: Center(
              child: Text(
                'CreateChatGroupView is working',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
