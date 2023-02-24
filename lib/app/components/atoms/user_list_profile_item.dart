// ignore_for_file: sort_child_properties_last

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
  final avatorUrl;
  final List<String> commonList;
  final String selfIntroduction;

  @override
  Widget build(BuildContext context) {
    return const TripleCommonProfile();
  }
}

class SingleCommonProfile extends StatelessWidget {
  const SingleCommonProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 200,
          height: 130,
          child: Stack(
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
                child: CircleAvatar(
                  backgroundColor: Colors.red,
                  child: Text(
                    "スポーツ",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  radius: 35,
                ),
                left: 20,
                top: 10,
              )
            ],
          ),
        ),
        Row(
          children: const [
            Text("ジョン・スノウ"),
            SizedBox(width: 16),
            Text("共通点 "),
            Text(
              "①",
              style: TextStyle(
                color: Colors.lightBlue,
                fontSize: 20,
              ),
            )
          ],
        ),
        const Text(
          "ジョン・スノウは落とし子であり、王家の血を引くものである。しかし、その出生は秘密裏に隠され、彼はエダード・スタークの妾の息子として育てられた。",
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

class DoubleCommonProfile extends StatelessWidget {
  const DoubleCommonProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 200,
          height: 130,
          child: Stack(
            children: const [
              Positioned(
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    "https://static.wikia.nocookie.net/gameofthrones/images/1/1f/Night_King_BTW.jpg/revision/latest?cb=20210722093007",
                  ),
                  radius: 35,
                ),
                right: 20,
                bottom: 10,
              ),
              Positioned(
                child: CircleAvatar(
                  backgroundColor: Colors.red,
                  child: Text(
                    "スポーツ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  radius: 30,
                ),
                left: 50,
                top: 10,
              ),
              Positioned(
                child: CircleAvatar(
                  backgroundColor: Colors.purple,
                  child: Text(
                    "映画",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  radius: 20,
                ),
                left: 20,
                bottom: 20,
              ),
            ],
          ),
        ),
        Row(
          children: const [
            Text("ナイツ・キング"),
            SizedBox(width: 16),
            Text("共通点 "),
            Text(
              "②",
              style: TextStyle(
                color: Colors.lightBlue,
                fontSize: 20,
              ),
            )
          ],
        ),
        const Text(
          "ナイツ・キング（夜の王）は死者の軍勢を率いる長であり不死身である。死者を統率し動かすのは彼の力あってのことである。",
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

class TripleCommonProfile extends StatelessWidget {
  const TripleCommonProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 200,
          height: 130,
          child: Stack(
            children: const [
              Positioned(
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    "https://d1uzk9o9cg136f.cloudfront.net/f/16783100/rc/2018/06/28/bea397d2528f42f11e6471563fd086abe82b25f2_xlarge.jpg",
                  ),
                ),
                left: 12,
                top: 48,
                right: 60,
                bottom: 12,
              ),
              Positioned(
                child: CircleAvatar(
                  backgroundColor: Colors.red,
                  child: Text(
                    "スポーツ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                  radius: 24,
                ),
                top: 4,
                right: 60,
              ),
              Positioned(
                child: CircleAvatar(
                  backgroundColor: Colors.purple,
                  child: Text(
                    "映画",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  radius: 20,
                ),
                left: 0,
                bottom: 0,
              ),
              Positioned(
                child: CircleAvatar(
                  backgroundColor: Colors.orange,
                  child: Text(
                    "旅行",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  radius: 32,
                ),
                right: 16,
                bottom: 4,
              ),
            ],
          ),
        ),
        Row(
          children: const [
            Text("デナーリス"),
            SizedBox(width: 16),
            Text("共通点 "),
            Text(
              "③",
              style: TextStyle(
                color: Colors.lightBlue,
                fontSize: 20,
              ),
            )
          ],
        ),
        const Text(
          "デナーリス・ターガリエンはエイリス・ターガリエン二世の娘であり、古ターガリエン王朝、ウェスタロスの前王室の最後の末裔の一人である。",
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

class QuadrupleCommonProfile extends StatelessWidget {
  const QuadrupleCommonProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Spacer();
  }
}
