import 'package:favoritism_communication/app/components/atoms/atoms.dart';
import 'package:flutter/material.dart';
import 'package:favoritism_communication/app/components/organisms/organisms.dart';

class QuadrupleCommonProfile extends StatelessWidget {
  const QuadrupleCommonProfile({
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
      widget: QuadrupleProfileContent(
        userName: userName,
        avatorUrl: avatorUrl,
        commonList: commonList,
      ),
      userName: userName,
      commonCount: 4,
      introduction: introduction,
    );
  }
}

class QuadrupleProfileContent extends StatelessWidget {
  const QuadrupleProfileContent({
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
          left: 28,
          top: 28,
          right: 28,
          bottom: 28,
          child: avatorUrl != null
              ? CircleAvatar(
                  backgroundImage: NetworkImage(
                    avatorUrl!,
                  ),
                )
              : const NoImageCircleAvator(
                  iconSize: 30,
                ),
        ),
        Positioned(
          top: 8,
          left: 20,
          child: CircleAvatar(
            backgroundColor: Colors.green,
            radius: 20,
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
          top: 0,
          right: 24,
          child: CircleAvatar(
            backgroundColor: Colors.red,
            radius: 24,
            child: Text(
              commonList[1],
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
            radius: 32,
            child: Text(
              commonList[2],
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ),
        ),
        Positioned(
          right: 12,
          bottom: 4,
          child: CircleAvatar(
            backgroundColor: Colors.orange,
            radius: 28,
            child: Text(
              commonList[3],
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
