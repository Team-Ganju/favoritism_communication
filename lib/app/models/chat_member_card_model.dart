class ChatMemberCardModel {
  String? roomName;
  String? lastMessage;
  String? profileImageURL;

  ChatMemberCardModel({this.roomName, this.lastMessage, this.profileImageURL});

  ChatMemberCardModel.fromJson(Map<String, dynamic> json) {
    roomName = json['roomName'];
    lastMessage = json['lastMessage'];
    profileImageURL = json['profileImageURL'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['roomName'] = roomName;
    data['lastMessage'] = lastMessage;
    data['profileImageURL'] = profileImageURL;
    return data;
  }
}
