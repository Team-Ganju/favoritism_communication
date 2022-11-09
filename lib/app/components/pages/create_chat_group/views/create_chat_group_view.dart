import 'package:flutter/material.dart';
import 'package:favoritism_communication/app/components/organisms/nav_bar.dart';
import 'package:favoritism_communication/app/components/atoms/atoms.dart';

import 'package:get/get.dart';

import '../controllers/create_chat_group_controller.dart';

class CreateChatGroupView extends GetView<CreateChatGroupController> {
  const CreateChatGroupView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(
        title: '友達を選択',
        backgroundColor: Colors.pink,
      ),
      body: Column(
        children: [
          SearchBar(),
          Expanded(
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
