import 'package:flutter/material.dart';
import 'package:favoritism_communication/app/components/atoms/atoms.dart';
import 'package:favoritism_communication/app/components/organisms/organisms.dart';

import 'package:get/get.dart';

import '../controllers/create_chat_group_controller.dart';

class CreateChatGroupView extends GetView<CreateChatGroupController> {
  const CreateChatGroupView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const NavBar(
        title: '友達を選択',
        backgroundColor: Colors.pink,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SearchBar(
              onChanged: (text) {
                if (text != null) controller.searchUser(text);
              },
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Obx(
                  () => ListView.builder(
                    itemCount: controller.candidateMemberCardDataList.length,
                    itemBuilder: (context, index) {
                      final CandidateMemberCardData candidateMemberCardData =
                          controller.candidateMemberCardDataList[index];
                      return CandidateMemberCard(
                        candidateMemberCardData: candidateMemberCardData,
                        onTap: () => controller
                                .candidateMemberCardDataList[index].isSelected
                            ? controller.unselect(candidateMemberCardData)
                            : controller.select(candidateMemberCardData),
                      );
                    },
                  ),
                ),
                // Obx(
                //   () => ListView.builder(
                //     itemCount: controller.searchResult.length + 1,
                //     itemBuilder: (context, index) {
                //       if (index == 0) {
                //         return controller.searchResult.isNotEmpty
                //             ? const Divider()
                //             : Container();
                //       } else {
                //         return Column(
                //           children: [
                //             SeachResultListTile(
                //               index: index,
                //               text:
                //                   controller.searchResult.elementAt(index - 1),
                //               onPressed: () =>
                //                   controller.searchResult.removeAt(index - 1),
                //             ),
                //             const Divider(),
                //           ],
                //         );
                //       }
                //     },
                //   ),
                // ),
              ],
            ),
          ),
          const CustomFooter(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomElevatedButton(
        buttonText: 'トークに移動する',
        initialActiveFlag: controller.isSelectedAtLeastOne.value,
        //FIXME: 遷移先の画面ができたら遷移処理を実装
        onPressed: controller.isSelectedAtLeastOne.value ? () {} : null,
      ),
    );
  }
}
