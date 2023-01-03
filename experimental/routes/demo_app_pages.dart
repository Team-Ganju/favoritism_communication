import 'package:get/get.dart';

import '../pages/demo_login/bindings/demo_login_binding.dart';
import '../pages/demo_login/views/demo_login_view.dart';
import '../pages/demo_home/bindings/demo_home_binding.dart';
import '../pages/demo_home/views/demo_home_view.dart';
import '../pages/demo_profile/bindings/demo_profile_binding.dart';
import '../pages/demo_profile/views/demo_profile_view.dart';
import '../pages/demo_update/bindings/demo_update_binding.dart';
import '../pages/demo_update/views/demo_update_view.dart';
import '../pages/demo_delete/bindings/demo_delete_binding.dart';
import '../pages/demo_delete/views/demo_delete_view.dart';
import '../pages/demo_create/bindings/demo_create_binding.dart';
import '../pages/demo_create/views/demo_create_view.dart';
part 'demo_app_routes.dart';

class DemoAppPages {
  DemoAppPages._();

  static const initial = DemoRoutes.demoLogin;

  static final routes = [
    GetPage(
      name: DemoRoutes.demoLogin,
      page: () => DemoLoginView(),
      binding: DemoLoginBinding(),
    ),
    GetPage(
      name: DemoRoutes.demoCreate,
      page: () => const DemoCreateView(),
      binding: DemoCreateBinding(),
    ),
    GetPage(
      name: DemoRoutes.demoProfile,
      page: () => const DemoProfileView(),
      binding: DemoProfileBinding(),
    ),
    GetPage(
      name: DemoRoutes.demoUpdate,
      page: () => const DemoUpdateView(),
      binding: DemoUpdateBinding(),
    ),
    GetPage(
      name: DemoRoutes.demoDelete,
      page: () => const DemoDeleteView(),
      binding: DemoDeleteBinding(),
    ),
    GetPage(
      name: DemoRoutes.demoHome,
      page: () => const DemoHomeView(),
      binding: DemoHomeBinding(),
    ),
  ];
}
