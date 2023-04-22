import 'package:favoritism_communication/app/models/chat_room_model.dart';
import 'package:favoritism_communication/app/dummy_data/chat_dummy_data.dart';
import 'package:favoritism_communication/app/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ChatRoomController extends GetxController {
  RxList<ChatRoomModel> chatRooms = <ChatRoomModel>[].obs;
  Rx<TextEditingController> messageTextController = TextEditingController().obs;

  final AuthService authService = Get.find();
  final ChatService chatService = Get.find();
  final RefreshController refreshController = RefreshController();

  @override
  void onInit() {
    fetchChatRoomData();
    super.onInit();
  }

  //TODO: firebaseから取得するように修正
  void fetchChatRoomData() {
    chatRooms
        .assignAll(chatRoomData.map((e) => ChatRoomModel.fromJson(e)).toList());
  }

  bool isSender(String senderId) {
    return authService.uid.val == senderId;
  }
}
