import 'package:flutter/material.dart';

class NoImageCircleAvator extends StatelessWidget {
  const NoImageCircleAvator({
    Key? key,
    required this.iconSize,
  }) : super(key: key);

  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.grey,
      child: Icon(
        Icons.person,
        color: Colors.white,
        size: iconSize,
      ),
    );
  }
}
