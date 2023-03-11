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
List<Map<String, dynamic>> privateChat = <Map<String, dynamic>>[
  {
    "roomName": "文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認",
    "mostRecentMessage":
        "文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認",
    "profileImageURL": ""
  },
  {"roomName": "Aさん", "mostRecentMessage": "私も〇〇好きです", "profileImageURL": ""},
  {"roomName": "Bさん", "mostRecentMessage": "私も〇〇好きです", "profileImageURL": ""},
  {"roomName": "Cさん", "mostRecentMessage": "私も〇〇好きです", "profileImageURL": ""},
  {"roomName": "Dさん", "mostRecentMessage": "私も〇〇好きです", "profileImageURL": ""},
  {"roomName": "Eさん", "mostRecentMessage": "私も〇〇好きです", "profileImageURL": ""}
];

// TODO: 全体的にUserのデータ構造を意識した形に整形し直す
List<Map<String, dynamic>> groupChat = [
  {
    "roomName": "グループA",
    "mostRecentMessage": "私も〇〇好きです",
    "profileImageURL":
        "https://shikimori-anime.com/core_sys/images/main/home/kv3.jpg"
  },
  {
    "roomName": "グループB",
    "mostRecentMessage": "私も〇〇好きです",
    "profileImageURL": "",
  },
  {
    "roomName": "グループC",
    "mostRecentMessage": "私も〇〇好きです",
    "profileImageURL": "https://anime-jam.com/images/mv04.jpg"
  },
  {
    "roomName": "グループD",
    "mostRecentMessage": "私も〇〇好きです",
    "profileImageURL": "https://www.tbs.co.jp/anime/5hanayome/img/ogp.jpg"
  },
  {
    "roomName": "グループE",
    "mostRecentMessage": "私も〇〇好きです",
    "profileImageURL":
        "https://kimetsu.com/anime/assets_portal/img/bnr_tv_mugen.jpg"
  },
  {
    "roomName": "グループF",
    "mostRecentMessage": "私も〇〇好きです",
    "profileImageURL":
        "https://img2.animatetimes.com/2020/10/627a3105695b6_72a539b218f44a96c0e41ee1ef98fb7c.jpg"
  }
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
