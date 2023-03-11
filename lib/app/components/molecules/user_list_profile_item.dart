import 'package:flutter/material.dart';
import 'package:favoritism_communication/app/components/organisms/organisms.dart';

class UserListProfileItem extends StatelessWidget {
  const UserListProfileItem({
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
    switch (commonList.length) {
      case 1:
        return SingleCommonProfile(
          userName: userName,
          avatorUrl: avatorUrl,
          commonList: commonList,
          introduction: introduction,
        );
      case 2:
        return DoubleCommonProfile(
          userName: userName,
          avatorUrl: avatorUrl,
          commonList: commonList,
          introduction: introduction,
        );
      case 3:
        return TripleCommonProfile(
          userName: userName,
          avatorUrl: avatorUrl,
          commonList: commonList,
          introduction: introduction,
        );
      default:
        return QuadrupleCommonProfile(
          userName: userName,
          avatorUrl: avatorUrl,
          commonList: commonList,
          introduction: introduction,
        );
    }
  }
}
