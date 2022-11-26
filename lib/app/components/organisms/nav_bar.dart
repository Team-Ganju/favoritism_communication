import 'package:flutter/material.dart';

/// iOS風ナビバー
class NavBar extends StatelessWidget implements PreferredSizeWidget {
  const NavBar(
      {Key? key,
      required this.backgroundColor,
      this.title,
      this.leading,
      this.child,
      this.trailing,
      this.toolbarHeight = kToolbarHeight})
      : super(key: key);

  final String? title;
  final Color backgroundColor;
  final Widget? leading;
  final Widget? child;
  final List<Widget>? trailing;
  final double toolbarHeight;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: Size.fromHeight(toolbarHeight),
        child: AppBar(
          toolbarHeight: 120,
          bottomOpacity: 0.0,
          elevation: 0.0,
          backgroundColor: backgroundColor,
          centerTitle: true,
          title: title != null ? Text(title ?? '') : child,
          leading: leading,
          actions: trailing,
        ));
  }

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight);
}
