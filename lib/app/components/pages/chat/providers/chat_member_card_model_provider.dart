import 'package:favoritism_communication/app/models/chat_member_card_model.dart';
import 'package:favoritism_communication/app/dummy_data/chat_dummy_data.dart';

class ChatMemberCardModelProvider {
  List<ChatMemberCardModel> individualChats = [];
  List<ChatMemberCardModel> groupChats = [];

  void fetchChatData() {
    //FIXME: firebaseに接続したらダミーデータを書き換え
    for (var data in chatRoomData) {
      if (data['isGroup']) {
        groupChats.add(ChatMemberCardModel.fromJson(data));
      } else {
        individualChats.add(ChatMemberCardModel.fromJson(data));
      }
    }
  }
}
