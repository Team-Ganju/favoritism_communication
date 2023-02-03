/// 後でJSONファイルから読み込む
List<Map<String, dynamic>> privateChat = <Map<String, dynamic>>[
  {
    "roomName": "文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認",
    "lastMessage":
        "文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認",
    "profileImageURL": "https://animeanime.jp/imgs/slider/526911.jpg"
  },
  {"roomName": "Aさん", "lastMessage": "私も〇〇好きです", "profileImageURL": ""},
  {"roomName": "Bさん", "lastMessage": "私も〇〇好きです", "profileImageURL": ""},
  {"roomName": "Cさん", "lastMessage": "私も〇〇好きです", "profileImageURL": ""},
  {"roomName": "Dさん", "lastMessage": "私も〇〇好きです", "profileImageURL": ""},
  {
    "roomName": "Eさん",
    "lastMessage": "私も〇〇好きです",
    "profileImageURL": "https://animeanime.jp/imgs/slider/526911.jpg"
  }
];

List<Map<String, dynamic>> groupChat = [
  {
    "roomName": "グループA",
    "lastMessage": "私も〇〇好きです",
    "profileImageURL":
        "https://shikimori-anime.com/core_sys/images/main/home/kv3.jpg"
  },
  {
    "roomName": "グループB",
    "lastMessage": "私も〇〇好きです",
    "profileImageURL": "https://animeanime.jp/imgs/slider/526911.jpg"
  },
  {
    "roomName": "グループC",
    "lastMessage": "私も〇〇好きです",
    "profileImageURL": "https://anime-jam.com/images/mv04.jpg"
  },
  {
    "roomName": "グループD",
    "lastMessage": "私も〇〇好きです",
    "profileImageURL": "https://www.tbs.co.jp/anime/5hanayome/img/ogp.jpg"
  },
  {
    "roomName": "グループE",
    "lastMessage": "私も〇〇好きです",
    "profileImageURL":
        "https://kimetsu.com/anime/assets_portal/img/bnr_tv_mugen.jpg"
  },
  {
    "roomName": "グループF",
    "lastMessage": "私も〇〇好きです",
    "profileImageURL":
        "https://img2.animatetimes.com/2020/10/627a3105695b6_72a539b218f44a96c0e41ee1ef98fb7c.jpg"
  }
];

// TalkRoom
const talkRoomData = [
  // グループデータ
  {
    "roomId": "group-001",
    "roomName": "グループA",
    "isGroup": true,
    "userId": "a",
    "lastMessage": "おはよう",
    "profileImage": null,
    "createdAt": null,
    "updatedAt": null,
    "messages": [
      {
        "messageId": "group-001-01",
        "messageFrom": "a",
        "userName": "Aさん",
        "profileImage": null,
        "media": null,
        "message": "おはよう",
        "createdAt": "2022/12/01",
        "updateAt": "2022/12/01",
      },
      {
        "messageId": "group-001-02",
        "messageFrom": "b",
        "userName": "Bさん",
        "profileImage": null,
        "media": null,
        "message": "こんにちは",
        "createdAt": "2022/12/02",
        "updateAt": "2022/12/02",
      },
      {
        "messageId": "group-001-03",
        "messageFrom": "c",
        "userName": "Cさん",
        "profileImage": null,
        "media": null,
        "message": "こんばんは",
        "createdAt": "2022/12/03",
        "updateAt": "2022/12/03",
      },
    ]
  },
  // 1 on 1
  {
    "roomId": "1on1-001",
    "roomName": "motaken",
    "isGroup": true,
    "userId": "A",
    "lastMessage": "おはよう",
    "profileImage": null,
    "createdAt": null,
    "updatedAt": null,
    "messages": [
      {
        "messageId": "1on1-001-01",
        "messageFrom": "a",
        "userName": "Aさん",
        "profileImage": null,
        "media": null,
        "message": "おはよう",
        "createdAt": "2022/12/01",
        "updateAt": "2022/12/01",
      },
      {
        "messageId": "1on1-001-02",
        "messageFrom": "b",
        "userName": "Bさん",
        "profileImage": null,
        "media": null,
        "message": "こんにちは",
        "createdAt": "2022/12/02",
        "updateAt": "2022/12/02",
      },
      {
        "messageId": "1on1-001-03",
        "messageFrom": "c",
        "userName": "Cさん",
        "profileImage": null,
        "media": null,
        "message": "こんばんは",
        "createdAt": "2022/12/03",
        "updateAt": "2022/12/03",
      },
    ]
  },
];
