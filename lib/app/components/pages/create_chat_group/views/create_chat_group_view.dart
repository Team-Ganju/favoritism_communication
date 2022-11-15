import 'package:flutter/material.dart';
import 'package:favoritism_communication/app/components/organisms/nav_bar.dart';
import 'package:favoritism_communication/app/components/atoms/atoms.dart';
import 'package:favoritism_communication/app/components/organisms/search_bar.dart';
import 'package:favoritism_communication/app/components/organisms/search_result_list_tile.dart';

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
            child: SearchBar(
              searchTarget: searchedTargetList,
              listController: controller.searchResult,
            ),
          ),
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: controller.searchResult.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return controller.searchResult.isNotEmpty
                        ? const Divider()
                        : Container();
                  } else {
                    return Column(
                      children: [
                        SeachResultListTile(
                          index: index,
                          text: controller.searchResult.elementAt(index - 1),
                          onPressed: () =>
                              controller.searchResult.removeAt(index - 1),
                        ),
                        const Divider(),
                      ],
                    );
                  }
                },
              ),
            ),
          ),
          const CustomFooter(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomElevatedButton(
        buttonText: 'トークに移動する',
        initialActiveFlag: controller.isMemberSelected.value,
        //FIXME: 遷移先の画面ができたら遷移処理を実装
        onPressed: controller.isMemberSelected.value ? () {} : null,
      ),
    );
  }
}
