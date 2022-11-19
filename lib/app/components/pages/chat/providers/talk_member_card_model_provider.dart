import 'package:favoritism_communication/app/components/pages/chat/talk_member_card_model_model.dart';
import 'package:favoritism_communication/app/dummy_data/chat_dummy_data.dart';

class TalkMemberCardModelProvider {
  List<TalkMemberCardModel> individualTalks = [];
  List<TalkMemberCardModel> groupTalks = [];

  void fetchChatData() {
    individualTalks =
        privateChat.map((e) => TalkMemberCardModel.fromJson(e)).toList();
    groupTalks = groupChat.map((e) => TalkMemberCardModel.fromJson(e)).toList();
  }
}
