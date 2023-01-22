class TalkMemberCardModel {
  String? roomName;
  String? mostRecentMessage;
  String? profileImageURL;

  TalkMemberCardModel(
      {this.roomName, this.mostRecentMessage, this.profileImageURL});

  TalkMemberCardModel.fromJson(Map<String, dynamic> json) {
    roomName = json['roomName'];
    mostRecentMessage = json['mostRecentMessage'];
    profileImageURL = json['profileImageURL'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['roomName'] = roomName;
    data['mostRecentMessage'] = mostRecentMessage;
    data['profileImageURL'] = profileImageURL;
    return data;
  }
}
