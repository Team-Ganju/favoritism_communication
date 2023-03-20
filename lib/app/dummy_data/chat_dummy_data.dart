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

// TODO: 全体的にUserのデータ構造を意識した形に整形し直す
List<Map<String, dynamic>> chatRoomData = [
  {
    "roomId": "group-001",
    "roomName": "グループA",
    "isGroup": true,
    "ownerId": "001",
    "lastMessage": "やっほー",
    "roomMembers": [
      "001",
      "002",
      "003",
    ],
    "roomImage":
        "https://shikimori-anime.com/core_sys/images/main/home/kv3.jpg",
    "createdAt": null,
    "updatedAt": null,
    "messages": [
      {
        "messageId": "group-001-01",
        "senderId": "001",
        "senderName": "Aさん",
        "profileImage": null,
        "media": null,
        "message": "みんな元気？",
        "createdAt": "2022/12/01",
      },
      {
        "messageId": "group-001-02",
        "senderId": "002",
        "senderName": "Bさん",
        "profileImage": null,
        "media": null,
        "message": "ワイは元気や",
        "createdAt": "2022/12/03",
      },
      {
        "messageId": "group-001-03",
        "senderId": "003",
        "senderName": "Cさん",
        "profileImage": null,
        "media": null,
        "message": "元気だよ〜",
        "createdAt": "2022/12/02",
      },
    ],
  },
  {
    "roomId": "group-002",
    "roomName": "グループB",
    "isGroup": true,
    "ownerId": "001",
    "lastMessage": "テスト",
    "roomMembers": [
      "001",
      "002",
      "003",
    ],
    "roomImage": null,
    "createdAt": null,
    "updatedAt": null,
    "messages": [
      {
        "messageId": "group-002-01",
        "senderId": "001",
        "senderName": "Aさん",
        "profileImage": null,
        "media": null,
        "message": "テストテスト",
        "createdAt": "2022/12/01",
      },
      {
        "messageId": "group-002-02",
        "senderId": "001",
        "senderName": "Aさん",
        "profileImage": null,
        "media": null,
        "message": "テストテスト",
        "createdAt": "2022/12/03",
      },
      {
        "messageId": "group-002-03",
        "senderId": "003",
        "senderName": "Cさん",
        "profileImage": null,
        "media": null,
        "message": "テストテスト",
        "createdAt": "2022/12/02",
      },
    ],
  },
  {
    "roomId": "group-003",
    "roomName": "グループB",
    "isGroup": true,
    "ownerId": "001",
    "lastMessage": "テスト",
    "roomMembers": [
      "001",
      "002",
      "003",
    ],
    "roomImage": null,
    "createdAt": null,
    "updatedAt": null,
    "messages": [
      {
        "messageId": "group-003-01",
        "senderId": "003",
        "senderName": "Cさん",
        "profileImage": null,
        "media": null,
        "message": "ああああああ",
        "createdAt": "2022/12/01",
      },
      {
        "messageId": "group-003-02",
        "senderId": "002",
        "senderName": "Bさん",
        "profileImage": null,
        "media": null,
        "message": "いいいいいいい",
        "createdAt": "2022/12/03",
      },
      {
        "messageId": "group-003-03",
        "senderId": "001",
        "senderName": "Aさん",
        "profileImage": null,
        "media": null,
        "message": "ううううう",
        "createdAt": "2022/12/02",
      },
    ],
  },
  // 1on1データ
  {
    "roomId": "group-004",
    "roomName": "Bさん",
    "isGroup": false,
    "ownerId": "001",
    "lastMessage": "テスト",
    "roomMembers": [
      "001",
      "002",
    ],
    "roomImage": null,
    "createdAt": null,
    "updatedAt": null,
    "messages": [
      {
        "messageId": "group-004-01",
        "senderId": "001",
        "senderName": "Aさん",
        "profileImage": null,
        "media": null,
        "message": "ああああああ",
        "createdAt": "2022/12/01",
      },
      {
        "messageId": "group-004-02",
        "senderId": "002",
        "senderName": "Bさん",
        "profileImage": null,
        "media": null,
        "message": "いいいいいいい",
        "createdAt": "2022/12/03",
      },
      {
        "messageId": "group-004-03",
        "senderId": "002",
        "senderName": "Bさん",
        "profileImage": null,
        "media": null,
        "message": "ううううう",
        "createdAt": "2022/12/02",
      },
    ],
  },
  {
    "roomId": "group-005",
    "roomName": "Dさん",
    "isGroup": false,
    "ownerId": "001",
    "lastMessage": "テスト",
    "roomMembers": [
      "001",
      "004",
    ],
    "roomImage": null,
    "createdAt": null,
    "updatedAt": null,
    "messages": [
      {
        "messageId": "group-005-01",
        "senderId": "001",
        "senderName": "Aさん",
        "profileImage": null,
        "media": null,
        "message": "ああああああ",
        "createdAt": "2022/12/01",
      },
      {
        "messageId": "group-005-02",
        "senderId": "004",
        "senderName": "Dさん",
        "profileImage": null,
        "media": null,
        "message": "いいいいいいい",
        "createdAt": "2022/12/03",
      },
      {
        "messageId": "group-005-03",
        "senderId": "004",
        "senderName": "Dさん",
        "profileImage": null,
        "media": null,
        "message": "ううううう",
        "createdAt": "2022/12/02",
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
