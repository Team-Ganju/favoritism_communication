/// 後でJSONファイルから読み込む
import 'package:favoritism_communication/app/components/organisms/organisms.dart';

// TODO: 外部からユーザデータを取得、isSelectedはfirestoreにはないアプリ内の独自フラグ
List<Map<String, dynamic>> friendData = [
  {
    'name': 'Aさん',
    'image': null,
    'isSelected': false,
  },
  {
    'name': 'ABさん',
    'image': null,
    'isSelected': false,
  },
  {
    'name': 'ABCさん',
    'image': null,
    'isSelected': false,
  },
  {
    'name': 'Bさん',
    'image': null,
    'isSelected': false,
  },
  {
    'name': 'BAさん',
    'image': null,
    'isSelected': false,
  },
  {
    'name': 'BACさん',
    'image': null,
    'isSelected': false,
  },
  {
    'name': 'Cさん',
    'image': null,
    'isSelected': false,
  },
  {
    'name': 'Dさん',
    'image': null,
    'isSelected': false,
  },
  {
    'name': 'Eさん',
    'image': null,
    'isSelected': false,
  },
  {
    'name': 'Fさん',
    'image': null,
    'isSelected': false,
  },
  {
    'name': 'Gさん',
    'image': null,
    'isSelected': false,
  },
];

const List<Map<String, dynamic>> chatRoomData = [
  {
    "roomId": "group-001",
    "roomName": "グループA",
    "isGroup": true,
    "userId": "a",
    "lastMessage": "やっほー",
    "profileImage":
        "https://shikimori-anime.com/core_sys/images/main/home/kv3.jpg",
    "createdAt": null,
    "updatedAt": null,
    "messages": [
      {
        "messageId": "group-001-01",
        "messageFrom": "a",
        "isSender": true,
        "userName": "Aさん",
        "profileImage": null,
        "media": null,
        "message": "みんな元気？",
        "createdAt": "2022/12/01",
      },
      {
        "messageId": "group-001-02",
        "messageFrom": "b",
        "isSender": false,
        "userName": "Bさん",
        "profileImage": null,
        "media": null,
        "message": "ワイは元気やで",
        "createdAt": "2022/12/02",
      },
      {
        "messageId": "group-001-03",
        "messageFrom": "c",
        "isSender": false,
        "userName": "Cさん",
        "profileImage": null,
        "media": null,
        "message": "やっほー",
        "createdAt": "2022/12/03",
      },
    ]
  },
  {
    "roomId": "group-002",
    "roomName": "グループB",
    "isGroup": true,
    "userId": "a",
    "lastMessage": "この間見た映画めっちゃおもろかった",
    "profileImage": "https://anime-jam.com/images/mv04.jpg",
    "createdAt": null,
    "updatedAt": null,
    "messages": [
      {
        "messageId": "group-002-01",
        "messageFrom": "a",
        "isSender": true,
        "userName": "Aさん",
        "profileImage": null,
        "media": null,
        "message": "映画見に行きたい！！",
        "createdAt": "2022/12/01",
      },
      {
        "messageId": "group-002-02",
        "messageFrom": "b",
        "isSender": false,
        "userName": "Bさん",
        "profileImage": null,
        "media": null,
        "message": "最近誰か映画見た？",
        "createdAt": "2022/12/02",
      },
      {
        "messageId": "group-002-03",
        "messageFrom": "c",
        "isSender": false,
        "userName": "Cさん",
        "profileImage": null,
        "media": null,
        "message": "この間見た映画めっちゃおもろかった",
        "createdAt": "2022/12/03",
      },
    ]
  },
  {
    "roomId": "group-003",
    "roomName": "グループC",
    "isGroup": true,
    "userId": "a",
    "lastMessage": "こんばんは",
    "profileImage": null,
    "createdAt": null,
    "updatedAt": null,
    "messages": [
      {
        "messageId": "group-003-01",
        "messageFrom": "a",
        "isSender": true,
        "userName": "Aさん",
        "profileImage": null,
        "media": null,
        "message": "ライブ行ってきた！",
        "createdAt": "2022/12/01",
      },
      {
        "messageId": "group-003-02",
        "messageFrom": "b",
        "isSender": false,
        "userName": "Bさん",
        "profileImage": null,
        "media": null,
        "message": "なんの？",
        "createdAt": "2022/12/02",
      },
      {
        "messageId": "group-003-03",
        "messageFrom": "c",
        "isSender": false,
        "userName": "Cさん",
        "profileImage": null,
        "media": null,
        "message": "いいなー",
        "createdAt": "2022/12/03",
      },
    ]
  },

  // ここから1 on 1チャットのデータ
  {
    "roomId": "1on1-001",
    "roomName": "もたけん",
    "isGroup": false,
    "userId": "aaaaa",
    "lastMessage": "どした？",
    "profileImage": null,
    "createdAt": null,
    "updatedAt": null,
    "messages": [
      {
        "messageId": "1on1-001-01",
        "messageFrom": "motakenID",
        "isSender": false,
        "userName": "もたけん",
        "profileImage": null,
        "media": null,
        "message": "うぃっす",
        "createdAt": "2022/12/01",
      },
      {
        "messageId": "1on1-001-02",
        "messageFrom": "motakenID",
        "isSender": false,
        "userName": "もたけん",
        "profileImage": null,
        "media": null,
        "message": "おーい",
        "createdAt": "2022/12/02",
      },
      {
        "messageId": "1on1-001-03",
        "messageFrom": "a",
        "isSender": true,
        "userName": "Aさん",
        "profileImage": null,
        "media": null,
        "message": "どした？",
        "createdAt": "2022/12/03",
      },
    ]
  },
  {
    "roomId": "1on1-002",
    "roomName": "kazuya nakazato",
    "isGroup": false,
    "userId": "aaaaa",
    "lastMessage": "沖縄いいところよ！",
    "profileImage": null,
    "createdAt": null,
    "updatedAt": null,
    "messages": [
      {
        "messageId": "1on1-002-01",
        "messageFrom": "kazuyaId",
        "isSender": false,
        "userName": "kazuya nakazato",
        "profileImage": null,
        "media": null,
        "message": "沖縄が地元です",
        "createdAt": "2022/12/01",
      },
      {
        "messageId": "1on1-002-02",
        "messageFrom": "Aさん",
        "isSender": true,
        "userName": "kazuya nakazato",
        "profileImage": null,
        "media": null,
        "message": "沖縄うらやましい〜",
        "createdAt": "2022/12/02",
      },
      {
        "messageId": "1on1-002-03",
        "messageFrom": "kazuyaId",
        "isSender": false,
        "userName": "kazuya nakazato",
        "profileImage": null,
        "media": null,
        "message": "沖縄いいところよ！",
        "createdAt": "2022/12/03",
      },
    ]
  },
  {
    "roomId": "1on1-003",
    "roomName": "ニッシー",
    "isGroup": false,
    "userId": "aaaaa",
    "lastMessage": "雪たくさん降るし寒いです。。",
    "profileImage": null,
    "createdAt": null,
    "updatedAt": null,
    "messages": [
      {
        "messageId": "1on1-003-01",
        "messageFrom": "a",
        "isSender": true,
        "userName": "Aさん",
        "profileImage": null,
        "media": null,
        "message": "何県ですか？",
        "createdAt": "2022/12/01",
      },
      {
        "messageId": "1on1-003-02",
        "messageFrom": "nisshyId",
        "isSender": false,
        "userName": "ニッシー",
        "profileImage": null,
        "media": null,
        "message": "長野です",
        "createdAt": "2022/12/02",
      },
      {
        "messageId": "1on1-003-03",
        "messageFrom": "nisshyId",
        "isSender": false,
        "userName": "ニッシー",
        "profileImage": null,
        "media": null,
        "message": "雪たくさん降るし寒いです。。",
        "createdAt": "2022/12/03",
      },
    ]
  },
];

List<FriendCardData> friendCardList = friendData.map(
  (item) {
    return FriendCardData(
      item['name'],
      item['image'],
      item['isSelected'],
    );
  },
).toList();
