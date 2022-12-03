import 'package:flutter/material.dart';
import 'package:favoritism_communication/app/components/atoms/atoms.dart';
import 'package:favoritism_communication/app/components/organisms/organisms.dart';
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
        backgroundColor: Colors.pink,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Focus(
              onFocusChange: (hasFocus) {
                controller.isFocusedOnSearchBar.value = hasFocus;
              },
              child: SearchBar(
                onChanged: (text) {
                  if (text != null) controller.searchUser(text);
                },
              ),
            ),
          ),
          //検索バーフォーカス時はSeachResultListTile、フォーカスが外れている場合はCandidateMemberCardを表示
          Obx(
            () => controller.isFocusedOnSearchBar.value
                ? Expanded(
                    child: ListView.builder(
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
                                text: controller.searchResult
                                    .elementAt(index - 1),
                                onIconButtonPressed: () =>
                                    controller.searchResult.removeAt(index - 1),
                                onTap: () {
                                  //HACK: TapされたSeachResultListTileのユーザー名に対応するCandidateMemberCardを選択状態にする処理
                                  //少し複雑なため、改良の余地あり。
                                  //candidateMemberCardDataListの中から、TapされたSeachResultListTileのユーザー名に対応する要素のindexを取得
                                  int indexAtTappedElement = controller
                                      .candidateMemberCardDataList
                                      .indexWhere(
                                    (element) =>
                                        element.userName ==
                                        controller.searchResult
                                            .elementAt(index - 1),
                                  );

                                  //誤タップ防止の為ローディング表示
                                  EasyLoading.show();

                                  //求めたindexに対応するcandidateMemberCardDataListの要素のisSelectedを選択状態(true)にする
                                  controller.select(
                                    controller.candidateMemberCardDataList[
                                        indexAtTappedElement],
                                  );

                                  Future.delayed(
                                    Duration(milliseconds: 500),
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
                        }
                      },
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
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
          ),
          const CustomFooter(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Obx(
        () => CustomElevatedButton(
          buttonText: 'トークに移動する',
          initialActiveFlag: controller.isSelectedAtLeastOne(),
          //FIXME: 遷移先の画面ができたら遷移処理を実装
          onPressed: controller.isSelectedAtLeastOne() ? () {} : null,
        ),
      ),
    );
  }
}
