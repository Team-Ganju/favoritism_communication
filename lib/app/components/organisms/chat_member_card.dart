import 'package:favoritism_communication/app/styles/styles.dart';
import 'package:flutter/material.dart';

class ChatMemberCard extends StatelessWidget {
  const ChatMemberCard({
    Key? key,
    required this.roomName,
    required this.lastMessage,
    required this.onTap,
    this.profileImage,
  }) : super(key: key);

  final String roomName;
  final String lastMessage;
  final String? profileImage;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap.call(),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
          side: BorderSide(
            color: colorChatMemberCardBorder,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              CircleAvatar(
                //TODO:firebase接続後に動作確認
                //profileImageがあればその画像を表示、なければグレー背景でpersonアイコンを表示
                foregroundImage:
                    profileImage != null ? NetworkImage(profileImage!) : null,
                backgroundColor: colorChatMemberCardCircleBg,
                child: const Icon(
                  Icons.person,
                  color: colorChatMemberCardIcon,
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
                      lastMessage,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
