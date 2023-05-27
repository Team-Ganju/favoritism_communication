import 'package:flutter/material.dart';

class CommonProfile extends StatelessWidget {
  const CommonProfile({
    Key? key,
    required this.widget,
    required this.userName,
    required this.commonCount,
    required this.introduction,
  }) : super(key: key);

  final Widget widget;
  final String userName;
  final int commonCount;
  final String introduction;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 200,
          height: 130,
          child: widget,
        ),
        Row(
          children: [
            Text(userName),
            const SizedBox(width: 16),
            const Padding(
              padding: EdgeInsets.only(right: 2.0),
              child: Text("共通点", style: TextStyle(fontSize: 13)),
            ),
            CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 10,
              child: Text(
                commonCount.toString(),
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
        Text(
          introduction,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
