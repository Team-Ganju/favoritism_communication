import 'package:favoritism_communication/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

/// テスト用のデータimportツール
void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  insertChatRooms();
}

void insertChatRooms() async {
  const data = [
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
  ];

  final db = FirebaseFirestore.instance;

  /// 処理実行時の時間
  final now = DateTime.now();

  for (var item in data) {
    /// 挿入時のdocId。ループの最初に毎回初期化。
    String insertDocId = '';

    await db.collection('chatRooms').add(
      {
        "roomName": item['roomName'],
        "isGroup": item['isGroup'],
        "ownerId": item['ownerId'],
        "lastMessage": item['lastMessage'],
        "roomMembers": item['roomMembers'],
        "roomImage": item['roomImage'],
        "createdAt": FieldValue.serverTimestamp(), // 仮でserverTimestamp
        "updatedAt": FieldValue.serverTimestamp(), // 仮でserverTimestamp
      },
    ).then((snapshot) => insertDocId = snapshot.id);

    /// createdAtをバラけさせるために利用。メッセージの数を数える。
    int i = 0;
    for (Map<String, dynamic> messageItem
        in item['messages'] as List<Map<String, dynamic>>) {
      await db
          .collection('chatRooms')
          .doc(insertDocId)
          .collection('messages')
          .add(
        {
          "senderId": messageItem['senderId'],
          "senderName": messageItem['senderName'],
          "profileImage": messageItem['profileImage'],
          "media": messageItem['media'],
          "message": messageItem['message'],
          "createdAt":
              DateTime(now.year, now.month, now.day, now.hour, now.second + i),
        },
      );

      i++;
    }
  }
}
