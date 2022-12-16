class TalkRoomModel {
  String? roomId;
  String? roomName;
  List<String> messages = [];

  String? messageId;
  String? messageFrom;
  String? userName;
  String? profileImage;
  String? media;
  String? message;
  String? createdAt;
  String? updateAt;

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
