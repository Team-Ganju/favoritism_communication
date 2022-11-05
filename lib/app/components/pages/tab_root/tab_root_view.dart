import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabRootView extends StatelessWidget {
  const TabRootView({
    super.key,
    required this.initialRoot,
  });

  final String initialRoot;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(initialRoot.hashCode),
      initialRoute: initialRoot,
      onGenerateRoute: (RouteSettings settings) =>
          PageRedirect(settings: settings, route: null).page<dynamic>(),
      onGenerateInitialRoutes: (NavigatorState navigator, String initialRoute) {
        final RouteSettings settings = RouteSettings(name: initialRoot);
        return <Route<dynamic>>[
          PageRedirect(settings: settings, route: null).page(),
        ];
      },
      observers: <GetObserver>[
        GetObserver((_) {}, Get.routing),
      ],
    );
  }
}
