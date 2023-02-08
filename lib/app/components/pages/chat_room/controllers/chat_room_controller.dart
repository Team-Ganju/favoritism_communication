import 'package:favoritism_communication/app/models/chat_room_model.dart';
import 'package:favoritism_communication/app/dummy_data/chat_dummy_data.dart';
import 'package:favoritism_communication/app/services/services.dart';
import 'package:get/get.dart';

class ChatRoomController extends GetxController {
  List<ChatRoomModel> chatRooms = <ChatRoomModel>[].obs;

  final ChatService chatService = Get.find();

  @override
  void onInit() {
    fetchChatRoomData();
    super.onInit();
  }

  //TODO: firebaseから取得するように修正
  void fetchChatRoomData() {
    chatRooms = chatRoomData.map((e) => ChatRoomModel.fromJson(e)).toList();
  }
}
