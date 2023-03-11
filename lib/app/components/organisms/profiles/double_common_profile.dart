import 'package:flutter/material.dart';
import 'package:favoritism_communication/app/components/organisms/organisms.dart';
import 'package:favoritism_communication/app/dummy_data/dummy_data.dart';

class DoubleCommonProfile extends StatelessWidget {
  const DoubleCommonProfile({
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
      widget: DoubleProfileContent(
        userName: userName,
        avatorUrl: avatorUrl,
        commonList: commonList,
      ),
      userName: userName,
      commonCount: 2,
      introduction: introduction,
    );
  }
}

class DoubleProfileContent extends StatelessWidget {
  const DoubleProfileContent({
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
          right: 20,
          bottom: 10,
          child: avatorUrl != null
              ? CircleAvatar(
                  backgroundImage: NetworkImage(
                    avatorUrl!,
                  ),
                  radius: 35,
                )
              : CircleAvatar(
                  backgroundColor: getRandomColor(),
                  radius: 35,
                  child: Text(
                    userName.isNotEmpty ? userName.substring(0, 1) : "n/a",
                  ),
                ),
        ),
        Positioned(
          left: 50,
          top: 10,
          child: CircleAvatar(
            backgroundColor: Colors.red,
            radius: 30,
            child: Text(
              commonList[0],
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ),
        ),
        Positioned(
          left: 20,
          bottom: 20,
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
      ],
    );
  }
}
