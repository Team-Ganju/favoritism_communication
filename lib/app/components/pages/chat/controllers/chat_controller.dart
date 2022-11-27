import 'package:favoritism_communication/app/components/pages/chat/providers/talk_member_card_model_provider.dart';
import 'package:favoritism_communication/app/services/services.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ChatController extends GetxController {
  final RxBool isGroupTalk = false.obs;
  final RefreshController refreshControllerInGroupList =
      RefreshController(initialRefresh: false);
  final RefreshController refreshControllerInPairList =
      RefreshController(initialRefresh: false);
  final TalkMemberCardModelProvider provider = Get.find();
  final ChatService chatService = Get.find();

  @override
  void onInit() {
    provider.fetchChatData();
    super.onInit();
  }

  void switchTalkPartner() {
    isGroupTalk.value = !isGroupTalk.value;
  }

  void onRefreshInGroupList() {
    try {
      // provider.fetchChatData();
      refreshControllerInGroupList.refreshCompleted();
    } catch (e) {
      refreshControllerInGroupList.refreshFailed();
    }
  }

  void onRefreshInPairList() {
    try {
      // provider.fetchChatData();
      refreshControllerInPairList.refreshCompleted();
    } catch (e) {
      refreshControllerInPairList.refreshFailed();
    }
  }
}
