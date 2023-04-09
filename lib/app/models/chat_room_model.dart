import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ChatRoomModel {
  String? roomId;
  String? roomName;
  bool? isGroup;
  String? ownerId;
  String? lastMessage;
  String? roomImage;
  List<String?> roomMembers = [];
  Timestamp? createdAt;
  Timestamp? updatedAt;
  late RxList<Map<String?, dynamic>> messages = <Map<String?, dynamic>>[].obs;

  ChatRoomModel({
    required this.roomId,
    required this.roomName,
    required this.isGroup,
    required this.ownerId,
    required this.lastMessage,
    required this.roomImage,
    required this.roomMembers,
    required this.createdAt,
    required this.updatedAt,
    required this.messages,
  });

  ChatRoomModel.fromJson(Map<String, dynamic> json) {
    roomId = json['roomId'];
    roomName = json['roomName'];
    isGroup = json['isGroup'];
    ownerId = json['ownerId'];
    lastMessage = json['lastMessage'];
    roomImage = json['roomImage'];
    roomMembers = json['roomMembers'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    messages.value = json['messages'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['roomId'] = roomId;
    data['roomName'] = roomName;
    data['isGroup'] = isGroup;
    data['ownerId'] = ownerId;
    data['lastMessage'] = lastMessage;
    data['roomImage'] = roomImage;
    data['roomMembers'] = roomMembers;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['messages'] = messages;
    return data;
  }
}
