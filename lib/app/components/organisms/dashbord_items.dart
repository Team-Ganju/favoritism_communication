import 'package:favoritism_communication/app/components/pages/tab_root/tab_root_view.dart';
import 'package:favoritism_communication/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';

class NavigationInfo {
  const NavigationInfo({
    required this.icon,
    required this.initialRoot,
    required this.label,
  });
  final IconData icon;
  final String initialRoot;
  final String label;
}

const List<NavigationInfo> _navigationInfos = [
  NavigationInfo(
    icon: CupertinoIcons.home,
    initialRoot: Routes.home,
    label: 'ホーム',
  ),
  NavigationInfo(
    icon: CupertinoIcons.search,
    initialRoot: Routes.search,
    label: 'さがす',
  ),
  NavigationInfo(
    icon: CupertinoIcons.chat_bubble,
    initialRoot: Routes.chat,
    label: 'チャット',
  ),
  NavigationInfo(
    icon: CupertinoIcons.person,
    initialRoot: Routes.mypage,
    label: 'プロフィール',
  ),
];

List<Widget> tabRootViews = _navigationInfos
    .map((e) => TabRootView(initialRoot: e.initialRoot))
    .toList();
List<BottomNavigationBarItem> bottomBarItems = _navigationInfos
    .map((e) => BottomNavigationBarItem(icon: Icon(e.icon), label: e.label))
    .toList();
