import 'package:cloud_firestore/cloud_firestore.dart';

class ChatMessageModel {
  String? senderId;
  String? senderName;
  String? profileImage;
  dynamic media;
  String? message;
  Timestamp? createdAt;

  ChatMessageModel({
    required this.senderId,
    required this.senderName,
    required this.profileImage,
    required this.media,
    required this.message,
    required this.createdAt,
  });

  ChatMessageModel.fromJson(Map<String, dynamic> json) {
    senderId = json['senderId'];
    senderName = json['senderName'];
    profileImage = json['profileImage'];
    media = json['media'];
    message = json['message'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['senderId'] = senderId;
    data['senderName'] = senderName;
    data['profileImage'] = profileImage;
    data['media'] = media;
    data['message'] = message;
    data['createdAt'] = createdAt;
    return data;
  }
}
