import 'package:favoritism_communication/app/components/atoms/atoms.dart';
import 'package:favoritism_communication/app/components/organisms/organisms.dart';
import 'package:favoritism_communication/app/components/organisms/search_bar.dart'
    as custom_sb;
import 'package:favoritism_communication/app/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
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
        backgroundColor: colorCreateChatViewBg,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Focus(
              onFocusChange: (hasFocus) {
                controller.isFocusedOnSearchBar.value = hasFocus;
              },
              child: custom_sb.SearchBar(
                onChanged: (text) {
                  if (text != null) controller.searchService.target(text);
                },
              ),
            ),
          ),
          //検索バーフォーカス時はSeachResultListTile、フォーカスが外れている場合はFriendCardを表示
          Obx(
            () => controller.isFocusedOnSearchBar.value
                ? Expanded(
                    child: ListView.builder(
                      itemCount: controller.searchResult.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            if (index == 0 &&
                                controller.searchResult.isNotEmpty)
                              const Divider(),
                            SeachResultListTile(
                              text: controller.searchResult.elementAt(index),
                              onIconButtonPressed: () =>
                                  controller.searchResult.removeAt(index),
                              onTap: () {
                                //HACK: TapされたSeachResultListTileのユーザー名に対応するFriendCardを選択状態にする処理
                                //少し複雑なため、改良の余地あり。
                                //friendCardDataListの中から、TapされたSeachResultListTileのユーザー名に対応する要素のindexを取得
                                int indexAtTappedElement =
                                    controller.friendCardDataList.indexWhere(
                                  (element) =>
                                      element.userName ==
                                      controller.searchResult.elementAt(index),
                                );

                                //誤タップ防止の為ローディング表示
                                EasyLoading.show();

                                //求めたindexに対応するfriendCardDataListの要素のisSelectedを選択状態(true)にする
                                controller.select(
                                  controller
                                      .friendCardDataList[indexAtTappedElement],
                                );

                                Future.delayed(
                                  const Duration(milliseconds: 500),
                                  () => EasyLoading.dismiss().then(
                                    (value) {
                                      //検索バーからフォーカスを外す
                                      controller.isFocusedOnSearchBar.value =
                                          false;
                                      FocusScope.of(context).unfocus();
                                    },
                                  ),
                                );
                              },
                            ),
                            const Divider(),
                          ],
                        );
                      },
                    ),
                  )
                //TODO: CustomSmartReflesherを導入するがHomeViewonLoadingなどはserviceとして独立させた方が良さそう
                : Expanded(
                    child: ListView.builder(
                      itemCount: controller.friendCardDataList.length,
                      itemBuilder: (context, index) {
                        final FriendCardData friendCardData =
                            controller.friendCardDataList[index];
                        return FriendCard(
                          friendCardData: friendCardData,
                          onTap: () =>
                              controller.friendCardDataList[index].isSelected
                                  ? controller.unselect(friendCardData)
                                  : controller.select(friendCardData),
                        );
                      },
                    ),
                  ),
          ),
          const CustomFooter(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Obx(
        () => CustomElevatedButton(
          buttonText: 'チャットに移動する',
          initialActiveFlag: controller.isSelectedAtLeastOne(),
          //FIXME: Get.back()でモーダルを閉じ、controller.selectedMemberDataListをChatViewに渡す
          onPressed: controller.isSelectedAtLeastOne() ? () {} : null,
        ),
      ),
    );
  }
}
