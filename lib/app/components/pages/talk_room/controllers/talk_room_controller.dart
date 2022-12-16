import 'package:favoritism_communication/app/components/pages/talk_room/talk_room_model.dart';
import 'package:favoritism_communication/app/dummy_data/chat_dummy_data.dart';
import 'package:favoritism_communication/app/services/services.dart';
import 'package:get/get.dart';

class TalkRoomController extends GetxController {
  List<TalkRoomModel> talkRooms = [];

  final ChatService chatService = Get.find();

  @override
  void onInit() {
    fetchTalkRoomData();
    super.onInit();
  }

  //TODO: firebaseから取得するように修正
  void fetchTalkRoomData() {
    talkRooms = talkRoom.map((e) => TalkRoomModel.fromJson(e)).toList();
  }
}
