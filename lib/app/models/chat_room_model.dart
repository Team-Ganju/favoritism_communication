import 'package:cloud_firestore/cloud_firestore.dart';

class ChatRoomModel {
  String? roomId;
  String? roomName;
  bool isGroup = false;
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

class MessageModel {
  String? messageId;
  String? messageFrom;
  String? userName;
  String? profileImage;
  String? media;
  String? message;
  String? createdAt;
  String? updateAt;

  MessageModel({
    required this.messageId,
    required this.messageFrom,
    required this.userName,
    required this.profileImage,
    required this.media,
    required this.message,
    required this.createdAt,
    required this.updateAt,
  });

  MessageModel.fromJson(Map<String, dynamic> json) {
    messageId = json['messageId'];
    messageFrom = json['messageFrom'];
    userName = json['userName'];
    profileImage = json['profileImage'];
    media = json['media'];
    message = json['message'];
    createdAt = json['createdAt'];
    updateAt = json['updateAt'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['messageId'] = messageId;
    data['messageFrom'] = messageFrom;
    data['userName'] = userName;
    data['profileImage'] = profileImage;
    data['media'] = media;
    data['message'] = message;
    data['createdAt'] = createdAt;
    data['updateAt'] = updateAt;
    return data;
  }
}
