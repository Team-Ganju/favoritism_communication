import 'package:flutter/material.dart';
import 'package:favoritism_communication/app/components/atoms/atoms.dart';
import 'package:favoritism_communication/app/components/organisms/organisms.dart';

class SingleCommonProfile extends StatelessWidget {
  const SingleCommonProfile({
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
      widget: SingleProfileContent(
        userName: userName,
        avatorUrl: avatorUrl,
        commonList: commonList,
      ),
      userName: userName,
      commonCount: 1,
      introduction: introduction,
    );
  }
}

class SingleProfileContent extends StatelessWidget {
  const SingleProfileContent({
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
                  radius: 40,
                )
              : const NoImageCircleAvator(
                  iconSize: 30,
                ),
        ),
        Positioned(
          left: 20,
          top: 10,
          child: CircleAvatar(
            backgroundColor: Colors.red,
            radius: 35,
            child: Text(
              commonList[0],
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }
}
