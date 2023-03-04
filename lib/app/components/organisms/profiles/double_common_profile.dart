import 'package:flutter/material.dart';
import 'package:favoritism_communication/app/components/organisms/organisms.dart';

class DoubleCommonProfile extends StatelessWidget {
  const DoubleCommonProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CommonProfile(
      widget: DoubleProfileContent(),
      name: "ナイツ・キング",
      commonCount: 3,
      introduction: "ナイツ・キング（夜の王）は死者の軍勢を率いる長であり不死身である。死者を統率し動かすのは彼の力あってのことである。",
    );
  }
}

class DoubleProfileContent extends StatelessWidget {
  const DoubleProfileContent({
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
    );
  }
}
