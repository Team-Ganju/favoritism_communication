import 'package:get/get.dart';

import '../pages/demologin/bindings/demologin_binding.dart';
import '../pages/demologin/views/demologin_view.dart';
import '../pages/home/home_binding.dart';
import '../pages/home/home_view.dart';
part 'demo_app_routes.dart';

class DemoAppPages {
  DemoAppPages._();

  static const initial = DemoRoutes.demoLogin;

  static final routes = [
    GetPage(
      name: _DemoPaths.demoHome,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _DemoPaths.demoLogin,
      page: () => DemologinView(),
      binding: DemologinBinding(),
    ),
  ];
}
