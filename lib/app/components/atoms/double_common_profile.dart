import 'package:flutter/material.dart';

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
                right: 20,
                bottom: 10,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    "https://static.wikia.nocookie.net/gameofthrones/images/1/1f/Night_King_BTW.jpg/revision/latest?cb=20210722093007",
                  ),
                  radius: 35,
                ),
              ),
              Positioned(
                left: 50,
                top: 10,
                child: CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 30,
                  child: Text(
                    "スポーツ",
                    style: TextStyle(
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
                    "映画",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          children: const [
            Text("ナイツ・キング"),
            SizedBox(width: 16),
            Text("共通点 "),
            CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 12,
              child: Text(
                "2",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
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
