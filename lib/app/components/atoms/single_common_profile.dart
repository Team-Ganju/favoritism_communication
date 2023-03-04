import 'package:flutter/material.dart';

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
          ),
        ),
        Row(
          children: const [
            Text("ジョン・スノウ"),
            SizedBox(width: 16),
            Text("共通点 "),
            CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 12,
              child: Text(
                "1",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
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
