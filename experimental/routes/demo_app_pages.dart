import 'package:get/get.dart';

import '../pages/home/home_binding.dart';
import '../pages/home/home_view.dart';
part 'demo_app_routes.dart';

class DemoAppPages {
  DemoAppPages._();

  static const initial = DemoRoutes.demoHome;

  static final routes = [
    GetPage(
      name: _DemoPaths.demoHome,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
  ];
}
