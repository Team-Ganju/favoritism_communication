import 'package:flutter/material.dart';
import 'package:favoritism_communication/app/components/organisms/organisms.dart';

class UserListProfileItem extends StatelessWidget {
  const UserListProfileItem({
    Key? key,
    required this.name,
    required this.avatorUrl,
    required this.commonList,
    required this.introduction,
  }) : super(key: key);

  final String name;
  final String? avatorUrl;
  final List<String> commonList;
  final String introduction;

  @override
  Widget build(BuildContext context) {
    switch (commonList.length) {
      case 1:
        return SingleCommonProfile(
          name: name,
          avatorUrl: avatorUrl,
          commonList: commonList,
          introduction: introduction,
        );
      case 2:
        return DoubleCommonProfile(
          name: name,
          avatorUrl: "",
          commonList: commonList,
          introduction: introduction,
        );
      case 3:
        return TripleCommonProfile(
          name: name,
          avatorUrl: "",
          commonList: commonList,
          introduction: introduction,
        );
      default:
        return QuadrupleCommonProfile(
          name: name,
          avatorUrl: "",
          commonList: commonList,
          introduction: introduction,
        );
    }
  }
}
