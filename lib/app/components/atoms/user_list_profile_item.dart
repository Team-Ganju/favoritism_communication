import 'package:favoritism_communication/app/components/atoms/double_common_profile.dart';
import 'package:favoritism_communication/app/components/atoms/quadraple_common_profile.dart';
import 'package:favoritism_communication/app/components/atoms/single_common_profile.dart';
import 'package:favoritism_communication/app/components/atoms/triple_common_profile.dart';
import 'package:flutter/material.dart';

class UserListProfileItem extends StatelessWidget {
  const UserListProfileItem({
    Key? key,
    required this.name,
    required this.avatorUrl,
    required this.commonList,
    required this.selfIntroduction,
  }) : super(key: key);

  final String name;
  final String? avatorUrl;
  final List<String> commonList;
  final String selfIntroduction;

  @override
  Widget build(BuildContext context) {
    switch (commonList.length) {
      case 1:
        return const SingleCommonProfile();
      case 2:
        return const DoubleCommonProfile();
      case 3:
        return const TripleCommonProfile();
      default:
        return const QuadrupleCommonProfile();
    }
  }
}
