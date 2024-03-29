import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CustomSmartRefresher extends StatelessWidget {
  const CustomSmartRefresher({
    super.key,
    required this.refreshController,
    this.scrollController,
    required this.enablePullDown,
    required this.enablePullUp,
    required this.child,
    this.onLoading,
    this.onRefresh,
  });

  final RefreshController refreshController;
  final ScrollController? scrollController;
  final bool enablePullDown;
  final bool enablePullUp;
  final VoidCallback? onLoading;
  final VoidCallback? onRefresh;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: scrollController,
      child: SmartRefresher(
        controller: refreshController,
        enablePullDown: false,
        enablePullUp: true,
        onRefresh: () => onRefresh?.call(),
        onLoading: () => onLoading?.call(),
        child: child,
      ),
    );
  }
}
