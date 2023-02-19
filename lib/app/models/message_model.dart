// TODO:　最終的に使用しなければ削除
// class MessageModel {
//   String? messageId;
//   String? messageFrom;
//   bool? isSender;
//   String? userName;
//   String? profileImage;
//   String? media;
//   String? message;
//   String? createdAt;

//   MessageModel({
//     required this.messageId,
//     required this.messageFrom,
//     required this.isSender,
//     required this.userName,
//     required this.profileImage,
//     required this.media,
//     required this.message,
//     required this.createdAt,
//   });

//   MessageModel.fromJson(Map<String, dynamic> json) {
//     messageId = json['messageId'];
//     messageFrom = json['messageFrom'];
//     isSender = json['isSender'];
//     userName = json['userName'];
//     profileImage = json['profileImage'];
//     media = json['media'];
//     message = json['message'];
//     createdAt = json['createdAt'];
//   }

//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['messageId'] = messageId;
//     data['messageFrom'] = messageFrom;
//     data['isSender'] = isSender;
//     data['userName'] = userName;
//     data['profileImage'] = profileImage;
//     data['media'] = media;
//     data['message'] = message;
//     data['createdAt'] = createdAt;
//     return data;
//   }
// }