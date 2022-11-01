import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// iOS風ナビバー
class NavBar extends StatelessWidget implements PreferredSizeWidget {
  const NavBar({
    Key? key,
    required this.backgroundColor,
    required this.hasBackButton,
    this.title,
    this.child,
    this.trailing,
  }) : super(key: key);

  final String? title;
  final Color backgroundColor;
  final bool hasBackButton;
  final Widget? child;
  final List<Widget>? trailing;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      bottomOpacity: 0.0,
      elevation: 0.0,
      backgroundColor: backgroundColor,
      centerTitle: true,
      shape: const Border(
        bottom: BorderSide(
          color: Colors.black,
        ),
      ),
      title: title != null
          ? Text(
              title ?? '',
              style: const TextStyle(color: Colors.black),
            )
          : child,
      leading: hasBackButton
          ? IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new,
              ),
              onPressed: () => Get.back<dynamic>(),
              color: Colors.grey,
              iconSize: 30,
            )
          : null,
      actions: trailing,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
