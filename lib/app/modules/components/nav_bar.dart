import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// iOS風ナビバー
class NavBar extends StatelessWidget implements PreferredSizeWidget {
  const NavBar({
    Key? key,
    required this.backgroundColor,
    this.title,
    this.leading,
    this.child,
    this.trailing,
  }) : super(key: key);

  final String? title;
  final Color backgroundColor;
  final Widget? leading;
  final Widget? child;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      bottomOpacity: 0.0,
      elevation: 0.0,
      backgroundColor: backgroundColor,
      centerTitle: true,
      title: title != null ? Text(title ?? '') : child,
      leading: leading,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
