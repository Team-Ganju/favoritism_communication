import 'package:flutter/material.dart';
import 'package:favoritism_communication/app/components/organisms/organisms.dart';

class QuadrupleCommonProfile extends StatelessWidget {
  const QuadrupleCommonProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CommonProfile(
      widget: QuadrupleProfileContent(),
      name: "ティリオン",
      commonCount: 3,
      introduction:
          "嘲りを込めて“小鬼”や“半人前”などとあだ名されるが、極めて高い知性の人である。父の政治的策略の才を受け継いでいるが、その醜さ、舌鋒の鋭さ、売春婦好きのため、そして出産が母親の死を招いたゆえに、父タイウィンから憎まれている。",
    );
  }
}

class QuadrupleProfileContent extends StatelessWidget {
  const QuadrupleProfileContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        Positioned(
          left: 28,
          top: 28,
          right: 28,
          bottom: 28,
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              "https://cdn-ak.f.st-hatena.com/images/fotolife/b/biruconti/20190321/20190321131807.jpg",
            ),
          ),
        ),
        Positioned(
          top: 8,
          left: 20,
          child: CircleAvatar(
            backgroundColor: Colors.green,
            radius: 20,
            child: Text(
              "料理",
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 24,
          child: CircleAvatar(
            backgroundColor: Colors.red,
            radius: 24,
            child: Text(
              "スポーツ",
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),
        ),
        Positioned(
          left: 0,
          bottom: 0,
          child: CircleAvatar(
            backgroundColor: Colors.purple,
            radius: 32,
            child: Text(
              "映画",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ),
        ),
        Positioned(
          right: 12,
          bottom: 4,
          child: CircleAvatar(
            backgroundColor: Colors.orange,
            radius: 28,
            child: Text(
              "旅行",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
