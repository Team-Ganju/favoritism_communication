import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:favoritism_communication/app/components/atoms/custom_elevated_button.dart';
import '../controllers/demo_profile_create_controller.dart';

class DemoProfileCreateView extends GetView<DemoProfileCreateController> {
  const DemoProfileCreateView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            Text("プロフィール情報登録",
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            CircleAvatar(
              backgroundColor: Colors.grey,
              child: const Icon(
                Icons.person,
                color: Colors.white,
                size: 120,
              ),
              radius: 80,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(

                      decoration: InputDecoration(
                        label: Text("ユーザ名"),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButton(
                      items: [
                        DropdownMenuItem(child: Text("男")),
                        DropdownMenuItem(child: Text("女")),
                      ],

                      onChanged: (arg) => {},
                      // decoration: InputDecoration(
                      //   label: Text("性別"),
                      //   border: OutlineInputBorder(),
                      // ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        label: Text("年代"),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        label: Text("自己紹介"),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
            ),

        CustomElevatedButton(
          buttonText: '登録する',
          initialActiveFlag: true,
          onPressed: () => {},
        )
          ],
        ),
      ),
    );
  }
}
