import 'package:cloud_firestore/cloud_firestore.dart';

class ChatRoomModel {
  String? roomId;
  String? roomName;
  bool? isGroup;
  String? lastMessage;
  String? userId;
  String? profileImage;
  Timestamp? createdAt;
  Timestamp? updatedAt;
  List<Map<String, dynamic>> messages = [];

  ChatRoomModel({
    required this.roomId,
    required this.roomName,
    required this.isGroup,
    required this.userId,
    required this.lastMessage,
    required this.profileImage,
    required this.createdAt,
    required this.updatedAt,
    required this.messages,
  });

  ChatRoomModel.fromJson(Map<String, dynamic> json) {
    roomId = json['roomId'];
    roomName = json['roomName'];
    isGroup = json['isGroup'];
    userId = json['userId'];
    lastMessage = json['lastMessage'];
    profileImage = json['profileImage'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    messages = json['messages'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['roomId'] = roomId;
    data['roomName'] = roomName;
    data['isGroup'] = isGroup;
    data['userId'] = userId;
    data['lastMessage'] = lastMessage;
    data['profileImage'] = profileImage;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['messages'] = messages;
    return data;
  }
}
