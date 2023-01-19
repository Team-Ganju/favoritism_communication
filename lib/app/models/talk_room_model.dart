class TalkRoomModel {
  String? roomId;
  String? roomName;
  List<Map<String, dynamic>> messages = [];

  TalkRoomModel({
    required this.roomId,
    required this.roomName,
    required this.messages,
  });

  TalkRoomModel.fromJson(Map<String, dynamic> json) {
    roomId = json['roomId'];
    roomName = json['roomName'];
    messages = json['messages'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['roomId'] = roomId;
    data['roomName'] = roomName;
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
