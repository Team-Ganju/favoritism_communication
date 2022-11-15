import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CustomSmartRefresher extends StatelessWidget {
  const CustomSmartRefresher({
    super.key,
    required this.refreshController,
    required this.enablePullDown,
    required this.enablePullUp,
    this.onLoading,
    this.onRefresh,
    this.child,
  });

  final RefreshController refreshController;
  final bool enablePullDown;
  final bool enablePullUp;
  final VoidCallback? onLoading;
  final VoidCallback? onRefresh;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: SmartRefresher(
          controller: refreshController,
          enablePullDown: false,
          enablePullUp: true,
          onRefresh: () => onRefresh?.call(),
          onLoading: () => onLoading?.call(),
          child: child),
    );
  }
}
