class ChatMemberCardModel {
  String? roomName;
  String? lastMessage;
  String? profileImage;

  ChatMemberCardModel({
    this.roomName,
    this.lastMessage,
    this.profileImage,
  });

  ChatMemberCardModel.fromJson(Map<String, dynamic> json) {
    roomName = json['roomName'];
    lastMessage = json['lastMessage'];
    profileImage = json['profileImage'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['roomName'] = roomName;
    data['lastMessage'] = lastMessage;
    data['profileImage'] = profileImage;
    return data;
  }
}
