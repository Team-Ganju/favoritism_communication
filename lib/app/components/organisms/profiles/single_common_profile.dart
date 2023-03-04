import 'package:favoritism_communication/app/components/organisms/profiles/common_profile.dart';
import 'package:flutter/material.dart';

class SingleCommonProfile extends StatelessWidget {
  const SingleCommonProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CommonProfile(
      widget: SingleProfileContent(),
      name: "ジョン・スノウ",
      commonCount: 3,
      introduction:
          "ジョン・スノウは落とし子であり、王家の血を引くものである。しかし、その出生は秘密裏に隠され、彼はエダード・スタークの妾の息子として育てられた。",
    );
  }
}

class SingleProfileContent extends StatelessWidget {
  const SingleProfileContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        Positioned(
          right: 20,
          bottom: 10,
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              "https://d1uzk9o9cg136f.cloudfront.net/f/16783100/rc/2020/07/06/0ae7a72d553b6e3408fadd225705dbdd5b694c15_xlarge.jpg",
            ),
            radius: 40,
          ),
        ),
        Positioned(
          left: 20,
          top: 10,
          child: CircleAvatar(
            backgroundColor: Colors.red,
            radius: 35,
            child: Text(
              "スポーツ",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }
}
