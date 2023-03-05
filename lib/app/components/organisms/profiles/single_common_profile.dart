import 'package:favoritism_communication/app/dummy_data/user_card_dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:favoritism_communication/app/components/organisms/organisms.dart';

class SingleCommonProfile extends StatelessWidget {
  const SingleCommonProfile({
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
    return CommonProfile(
      widget: SingleProfileContent(
        name: name,
        avatorUrl: avatorUrl,
        commonList: commonList,
      ),
      name: name,
      commonCount: 1,
      introduction: introduction,
    );
  }
}

class SingleProfileContent extends StatelessWidget {
  const SingleProfileContent({
    Key? key,
    required this.name,
    required this.avatorUrl,
    required this.commonList,
  }) : super(key: key);

  final String name;
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
              : CircleAvatar(
                  backgroundColor: getRandomColor(),
                  radius: 40,
                  child: Text(
                    name.isNotEmpty ? name.substring(0, 1) : "n/a",
                  ),
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
