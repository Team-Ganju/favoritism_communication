import 'package:flutter/material.dart';
import 'package:favoritism_communication/app/components/organisms/organisms.dart';
import 'package:favoritism_communication/app/dummy_data/dummy_data.dart';

class TripleCommonProfile extends StatelessWidget {
  const TripleCommonProfile({
    Key? key,
    required this.userName,
    required this.avatorUrl,
    required this.commonList,
    required this.introduction,
  }) : super(key: key);

  final String userName;
  final String? avatorUrl;
  final List<String> commonList;
  final String introduction;

  @override
  Widget build(BuildContext context) {
    return CommonProfile(
      widget: TripleProfileContent(
        userName: userName,
        avatorUrl: avatorUrl,
        commonList: commonList,
      ),
      userName: userName,
      commonCount: 3,
      introduction: introduction,
    );
  }
}

class TripleProfileContent extends StatelessWidget {
  const TripleProfileContent({
    Key? key,
    required this.userName,
    required this.avatorUrl,
    required this.commonList,
  }) : super(key: key);

  final String userName;
  final String? avatorUrl;
  final List<String> commonList;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 12,
          top: 48,
          right: 60,
          bottom: 12,
          child: avatorUrl != null
              ? CircleAvatar(
                  backgroundImage: NetworkImage(
                    avatorUrl!,
                  ),
                )
              : CircleAvatar(
                  backgroundColor: getRandomColor(),
                  child: Text(
                    userName.isNotEmpty ? userName.substring(0, 1) : "n/a",
                  ),
                ),
        ),
        Positioned(
          top: 4,
          right: 60,
          child: CircleAvatar(
            backgroundColor: Colors.red,
            radius: 24,
            child: Text(
              commonList[0],
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),
        ),
        Positioned(
          left: 0,
          bottom: 0,
          child: CircleAvatar(
            backgroundColor: Colors.purple,
            radius: 20,
            child: Text(
              commonList[1],
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ),
        ),
        Positioned(
          right: 16,
          bottom: 4,
          child: CircleAvatar(
            backgroundColor: Colors.orange,
            radius: 32,
            child: Text(
              commonList[2],
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
