import 'package:favoritism_communication/app/models/chat_member_card_model.dart';
import 'package:favoritism_communication/app/dummy_data/chat_dummy_data.dart';

class ChatMemberCardModelProvider {
  List<ChatMemberCardModel> individualChats = [];
  List<ChatMemberCardModel> groupChats = [];

  void fetchChatData() {
    individualChats =
        privateChat.map((e) => ChatMemberCardModel.fromJson(e)).toList();
    groupChats = groupChat.map((e) => ChatMemberCardModel.fromJson(e)).toList();
  }
}
