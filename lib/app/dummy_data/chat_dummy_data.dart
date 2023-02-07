// /// 後でJSONファイルから読み込む
// List<Map<String, dynamic>> privateChat = <Map<String, dynamic>>[
//   {
//     "roomName": "文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認",
//     "lastMessage":
//         "文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認文字切れ確認",
//     "profileImage": "https://animeanime.jp/imgs/slider/526911.jpg"
//   },
//   {"roomName": "Aさん", "lastMessage": "私も〇〇好きです", "profileImage": null},
//   {"roomName": "Bさん", "lastMessage": "私も〇〇好きです", "profileImage": null},
//   {"roomName": "Cさん", "lastMessage": "私も〇〇好きです", "profileImage": null},
//   {"roomName": "Dさん", "lastMessage": "私も〇〇好きです", "profileImage": null},
//   {
//     "roomName": "Eさん",
//     "lastMessage": "私も〇〇好きです",
//     "profileImage": "https://animeanime.jp/imgs/slider/526911.jpg"
//   }
// ];

// List<Map<String, dynamic>> groupChat = [
//   {
//     "roomName": "グループA",
//     "lastMessage": "私も〇〇好きです",
//     "profileImage":
//         "https://shikimori-anime.com/core_sys/images/main/home/kv3.jpg"
//   },
//   {
//     "roomName": "グループB",
//     "lastMessage": "私も〇〇好きです",
//     "profileImage": "https://animeanime.jp/imgs/slider/526911.jpg"
//   },
//   {
//     "roomName": "グループC",
//     "lastMessage": "私も〇〇好きです",
//     "profileImage": "https://anime-jam.com/images/mv04.jpg"
//   },
//   {
//     "roomName": "グループD",
//     "lastMessage": "私も〇〇好きです",
//     "profileImage": "https://www.tbs.co.jp/anime/5hanayome/img/ogp.jpg"
//   },
//   {
//     "roomName": "グループE",
//     "lastMessage": "私も〇〇好きです",
//     "profileImage":
//         "https://kimetsu.com/anime/assets_portal/img/bnr_tv_mugen.jpg"
//   },
//   {
//     "roomName": "グループF",
//     "lastMessage": "私も〇〇好きです",
//     "profileImage":
//         "https://img2.animatetimes.com/2020/10/627a3105695b6_72a539b218f44a96c0e41ee1ef98fb7c.jpg"
//   }
// ];

// ChatRoom
const List<Map<String, dynamic>> chatRoomData = [
  // グループチャットのデータ(isGroupがtrue)
  {
    "roomId": "group-001",
    "roomName": "グループA",
    "isGroup": true,
    "userId": "aaaaa",
    "lastMessage": "やっほー",
    "profileImage":
        "https://shikimori-anime.com/core_sys/images/main/home/kv3.jpg",
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
        "message": "おはよう",
        "createdAt": "2022/12/03",
        "updateAt": "2022/12/03",
      },
    ]
  },
  {
    "roomId": "group-002",
    "roomName": "グループB",
    "isGroup": true,
    "userId": "aaaaa",
    "lastMessage": "こんばんは",
    "profileImage": "https://anime-jam.com/images/mv04.jpg",
    "createdAt": null,
    "updatedAt": null,
    "messages": [
      {
        "messageId": "group-002-01",
        "messageFrom": "a",
        "userName": "Aさん",
        "profileImage": null,
        "media": null,
        "message": "おはよう",
        "createdAt": "2022/12/01",
        "updateAt": "2022/12/01",
      },
      {
        "messageId": "group-002-02",
        "messageFrom": "b",
        "userName": "Bさん",
        "profileImage": null,
        "media": null,
        "message": "こんにちは",
        "createdAt": "2022/12/02",
        "updateAt": "2022/12/02",
      },
      {
        "messageId": "group-002-03",
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
  {
    "roomId": "group-003",
    "roomName": "グループC",
    "isGroup": true,
    "userId": "aaaaa",
    "lastMessage": "こんばんは",
    "profileImage": null,
    "createdAt": null,
    "updatedAt": null,
    "messages": [
      {
        "messageId": "group-003-01",
        "messageFrom": "a",
        "userName": "Aさん",
        "profileImage": null,
        "media": null,
        "message": "おはよう",
        "createdAt": "2022/12/01",
        "updateAt": "2022/12/01",
      },
      {
        "messageId": "group-003-02",
        "messageFrom": "b",
        "userName": "Bさん",
        "profileImage": null,
        "media": null,
        "message": "こんにちは",
        "createdAt": "2022/12/02",
        "updateAt": "2022/12/02",
      },
      {
        "messageId": "group-003-03",
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

  // ここから1 on 1チャットのデータ
  {
    "roomId": "1on1-001",
    "roomName": "もたけん",
    "isGroup": false,
    "userId": "aaaaa",
    "lastMessage": "おはよう",
    "profileImage": null,
    "createdAt": null,
    "updatedAt": null,
    "messages": [
      {
        "messageId": "1on1-001-01",
        "messageFrom": "motakenID",
        "userName": "もたけん",
        "profileImage": null,
        "media": null,
        "message": "おはよう",
        "createdAt": "2022/12/01",
        "updateAt": "2022/12/01",
      },
      {
        "messageId": "1on1-001-02",
        "messageFrom": "motakenID",
        "userName": "もたけん",
        "profileImage": null,
        "media": null,
        "message": "こんにちは",
        "createdAt": "2022/12/02",
        "updateAt": "2022/12/02",
      },
      {
        "messageId": "1on1-001-03",
        "messageFrom": "motakenID",
        "userName": "もたけん",
        "profileImage": null,
        "media": null,
        "message": "こんばんは",
        "createdAt": "2022/12/03",
        "updateAt": "2022/12/03",
      },
    ]
  },
  {
    "roomId": "1on1-002",
    "roomName": "kazuya nakazato",
    "isGroup": false,
    "userId": "aaaaa",
    "lastMessage": "おはよう",
    "profileImage": null,
    "createdAt": null,
    "updatedAt": null,
    "messages": [
      {
        "messageId": "1on1-002-01",
        "messageFrom": "kazuyaId",
        "userName": "kazuya nakazato",
        "profileImage": null,
        "media": null,
        "message": "おはよう",
        "createdAt": "2022/12/01",
        "updateAt": "2022/12/01",
      },
      {
        "messageId": "1on1-002-02",
        "messageFrom": "kazuyaId",
        "userName": "kazuya nakazato",
        "profileImage": null,
        "media": null,
        "message": "こんにちは",
        "createdAt": "2022/12/02",
        "updateAt": "2022/12/02",
      },
      {
        "messageId": "1on1-002-03",
        "messageFrom": "kazuyaId",
        "userName": "kazuya nakazato",
        "profileImage": null,
        "media": null,
        "message": "こんばんは",
        "createdAt": "2022/12/03",
        "updateAt": "2022/12/03",
      },
    ]
  },
  {
    "roomId": "1on1-003",
    "roomName": "ニッシー",
    "isGroup": false,
    "userId": "aaaaa",
    "lastMessage": "おはよう",
    "profileImage": null,
    "createdAt": null,
    "updatedAt": null,
    "messages": [
      {
        "messageId": "1on1-003-01",
        "messageFrom": "nisshyId",
        "userName": "ニッシー",
        "profileImage": null,
        "media": null,
        "message": "おはよう",
        "createdAt": "2022/12/01",
        "updateAt": "2022/12/01",
      },
      {
        "messageId": "1on1-003-02",
        "messageFrom": "nisshyId",
        "userName": "ニッシー",
        "profileImage": null,
        "media": null,
        "message": "こんにちは",
        "createdAt": "2022/12/02",
        "updateAt": "2022/12/02",
      },
      {
        "messageId": "1on1-003-03",
        "messageFrom": "nisshyId",
        "userName": "ニッシー",
        "profileImage": null,
        "media": null,
        "message": "こんばんは",
        "createdAt": "2022/12/03",
        "updateAt": "2022/12/03",
      },
    ]
  },
];
