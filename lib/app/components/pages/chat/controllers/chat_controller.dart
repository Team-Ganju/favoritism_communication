import 'package:favoritism_communication/app/components/pages/chat/providers/talk_member_card_model_provider.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ChatController extends GetxController {
  final RxBool isGroupTalk = false.obs;
  final RefreshController refreshController = RefreshController();
  final TalkMemberCardModelProvider provider = Get.find();

  @override
  void onInit() {
    provider.fetchChatData();
    super.onInit();
  }

  void switchTalkPartner() {
    isGroupTalk.value = !isGroupTalk.value;
  }
}
