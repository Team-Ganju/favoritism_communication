import 'package:favoritism_communication/app/dummy_data/chat_dummy_data.dart';
import 'package:favoritism_communication/app/models/chat_room_model.dart';

class ChatMemberCardModelProvider {
  List<ChatRoomModel> individualChats = [];
  List<ChatRoomModel> groupChats = [];

  void fetchChatData() {
    //FIXME: firebaseに接続したらダミーデータを書き換え
    for (var data in chatRoomData) {
      if (data['isGroup']) {
        groupChats.add(ChatRoomModel.fromJson(data));
      } else {
        individualChats.add(ChatRoomModel.fromJson(data));
      }
    }
  }
}
