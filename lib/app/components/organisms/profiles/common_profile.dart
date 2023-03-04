import 'package:flutter/material.dart';

class CommonProfile extends StatelessWidget {
  const CommonProfile({
    Key? key,
    required this.widget,
    required this.name,
    required this.commonCount,
    required this.introduction,
  }) : super(key: key);

  final Widget widget;
  final String name;
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
            Text(name),
            const SizedBox(width: 16),
            const Text("共通点 "),
            CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 12,
              child: Text(
                commonCount.toString(),
                style: const TextStyle(
                  fontSize: 16,
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
