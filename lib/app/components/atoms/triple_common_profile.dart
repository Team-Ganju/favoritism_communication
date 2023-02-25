import 'package:flutter/material.dart';

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
                left: 12,
                top: 48,
                right: 60,
                bottom: 12,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    "https://d1uzk9o9cg136f.cloudfront.net/f/16783100/rc/2018/06/28/bea397d2528f42f11e6471563fd086abe82b25f2_xlarge.jpg",
                  ),
                ),
              ),
              Positioned(
                top: 4,
                right: 60,
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
              Positioned(
                right: 16,
                bottom: 4,
                child: CircleAvatar(
                  backgroundColor: Colors.orange,
                  radius: 32,
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
          ),
        ),
        Row(
          children: const [
            Text("デナーリス"),
            SizedBox(width: 16),
            Text("共通点 "),
            CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 12,
              child: Text(
                "3",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
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
