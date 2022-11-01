import 'package:flutter/material.dart';

class TalkMemberCard extends StatelessWidget {
  const TalkMemberCard({
    Key? key,
    required this.roomName,
    required this.mostRecentMessage,
    this.profileImageURL,
  }) : super(key: key);

  final String roomName;
  final String mostRecentMessage;
  final String? profileImageURL;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
        side: BorderSide(
          //FIXME: 各種項目の色はアプリ全体の色を管理するファイルから参照するように修正する
          color: Colors.grey.shade300,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            CircleAvatar(
              //TODO:firebase接続後に動作確認
              //profileImageURLがあればその画像を表示、なければグレー背景でpersonアイコンを表示
              foregroundImage: profileImageURL != null
                  ? NetworkImage(profileImageURL!)
                  : null,
              backgroundColor: Colors.grey,
              child: const Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    roomName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 20),
                  ),
                  Text(
                    mostRecentMessage,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
