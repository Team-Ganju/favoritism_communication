/// 後でJSONファイルから読み込む
List<Map<String, dynamic>> privateChat = <Map<String, dynamic>>[
  {
    "roomName": "文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認",
    "mostRecentMessage":
        "文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認",
    "profileImageURL": "https://animeanime.jp/imgs/slider/526911.jpg"
  },
  {"roomName": "Aさん", "mostRecentMessage": "私も〇〇好きです", "profileImageURL": ""},
  {"roomName": "Bさん", "mostRecentMessage": "私も〇〇好きです", "profileImageURL": ""},
  {"roomName": "Cさん", "mostRecentMessage": "私も〇〇好きです", "profileImageURL": ""},
  {"roomName": "Dさん", "mostRecentMessage": "私も〇〇好きです", "profileImageURL": ""},
  {
    "roomName": "Eさん",
    "mostRecentMessage": "私も〇〇好きです",
    "profileImageURL": "https://animeanime.jp/imgs/slider/526911.jpg"
  }
];

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
    "profileImageURL": "https://animeanime.jp/imgs/slider/526911.jpg"
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

// TalkRoom
const talkRoomData = [
  {
    "roomId": "001",
    "roomName": "グループA",
    "messages": [
      {
        "messageId": "001",
        "messageFrom": "a",
        "userName": "Aさん",
        "profileImage": null,
        "media": null,
        "message": "おはよう",
        "createdAt": "2022/12/01",
        "updateAt": "2022/12/01",
      },
      {
        "messageId": "002",
        "messageFrom": "b",
        "userName": "Bさん",
        "profileImage": null,
        "media": null,
        "message": "こんにちは",
        "createdAt": "2022/12/03",
        "updateAt": "2022/12/03",
      },
      {
        "messageId": "003",
        "messageFrom": "c",
        "userName": "Cさん",
        "profileImage": null,
        "media": null,
        "message": "こんばんは",
        "createdAt": "2022/12/02",
        "updateAt": "2022/12/02",
      },
      {
        "messageId": "004",
        "messageFrom": "d",
        "userName": "Dさん",
        "profileImage": null,
        "media": null,
        "message": "さようなら",
        "createdAt": "2022/12/04",
        "updateAt": "2022/12/04",
      },
    ]
  },
  {
    "roomId": "002",
    "roomName": "グループB",
    "messages": [
      {
        "messageId": "001",
        "messageFrom": "a",
        "userName": "Aさん",
        "profileImage": null,
        "media": null,
        "message": "おはよう",
        "createdAt": "2022/12/01",
        "updateAt": "2022/12/01",
      },
      {
        "messageId": "002",
        "messageFrom": "b",
        "userName": "Bさん",
        "profileImage": null,
        "media": null,
        "message": "こんにちは",
        "createdAt": "2022/12/03",
        "updateAt": "2022/12/03",
      },
      {
        "messageId": "003",
        "messageFrom": "c",
        "userName": "Cさん",
        "profileImage": null,
        "media": null,
        "message": "こんばんは",
        "createdAt": "2022/12/02",
        "updateAt": "2022/12/02",
      },
      {
        "messageId": "004",
        "messageFrom": "d",
        "userName": "Dさん",
        "profileImage": null,
        "media": null,
        "message": "さようなら",
        "createdAt": "2022/12/04",
        "updateAt": "2022/12/04",
      },
    ]
  },
  {
    "roomId": "003",
    "roomName": "グループC",
    "messages": [
      {
        "messageId": "001",
        "messageFrom": "a",
        "userName": "Aさん",
        "profileImage": null,
        "media": null,
        "message": "おはよう",
        "createdAt": "2022/12/01",
        "updateAt": "2022/12/01",
      },
      {
        "messageId": "002",
        "messageFrom": "b",
        "userName": "Bさん",
        "profileImage": null,
        "media": null,
        "message": "こんにちは",
        "createdAt": "2022/12/03",
        "updateAt": "2022/12/03",
      },
      {
        "messageId": "003",
        "messageFrom": "c",
        "userName": "Cさん",
        "profileImage": null,
        "media": null,
        "message": "こんばんは",
        "createdAt": "2022/12/02",
        "updateAt": "2022/12/02",
      },
      {
        "messageId": "004",
        "messageFrom": "d",
        "userName": "Dさん",
        "profileImage": null,
        "media": null,
        "message": "さようなら",
        "createdAt": "2022/12/04",
        "updateAt": "2022/12/04",
      },
    ]
  },
  {
    "roomId": "004",
    "roomName": "グループD",
    "messages": [
      {
        "messageId": "001",
        "messageFrom": "a",
        "userName": "Aさん",
        "profileImage": null,
        "media": null,
        "message": "おはよう",
        "createdAt": "2022/12/01",
        "updateAt": "2022/12/01",
      },
      {
        "messageId": "002",
        "messageFrom": "b",
        "userName": "Bさん",
        "profileImage": null,
        "media": null,
        "message": "こんにちは",
        "createdAt": "2022/12/03",
        "updateAt": "2022/12/03",
      },
      {
        "messageId": "003",
        "messageFrom": "c",
        "userName": "Cさん",
        "profileImage": null,
        "media": null,
        "message": "こんばんは",
        "createdAt": "2022/12/02",
        "updateAt": "2022/12/02",
      },
      {
        "messageId": "004",
        "messageFrom": "d",
        "userName": "Dさん",
        "profileImage": null,
        "media": null,
        "message": "さようなら",
        "createdAt": "2022/12/04",
        "updateAt": "2022/12/04",
      },
    ]
  },
];
