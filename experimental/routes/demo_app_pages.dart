import 'package:get/get.dart';

import '../pages/demo_login/bindings/demo_login_binding.dart';
import '../pages/demo_login/views/demo_login_view.dart';
import '../pages/demo_home/bindings/demo_home_binding.dart';
import '../pages/demo_home/views/demo_home_view.dart';
import '../pages/demo_profile/bindings/demo_profile_binding.dart';
import '../pages/demo_profile/views/demo_profile_view.dart';
import '../pages/demo_profile_update/bindings/demo_profile_update_binding.dart';
import '../pages/demo_profile_update/views/demo_profile_update_view.dart';
import '../pages/demo_profile_delete/bindings/demo_profile_delete_binding.dart';
import '../pages/demo_profile_delete/views/demo_profile_delete_view.dart';
import '../pages/demo_profile_create/bindings/demo_profile_create_binding.dart';
import '../pages/demo_profile_create/views/demo_profile_create_view.dart';
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
      name: DemoRoutes.demoProfileCreate,
      page: () => DemoProfileCreateView(),
      binding: DemoProfileCreateBinding(),
    ),
    GetPage(
      name: DemoRoutes.demoProfile,
      page: () => const DemoProfileView(),
      binding: DemoProfileBinding(),
    ),
    GetPage(
      name: DemoRoutes.demoProfileUpdate,
      page: () => const DemoProfileUpdateView(),
      binding: DemoProfileUpdateBinding(),
    ),
    GetPage(
      name: DemoRoutes.demoProfileDelete,
      page: () => const DemoProfileDeleteView(),
      binding: DemoProfileDeleteBinding(),
    ),
    GetPage(
      name: DemoRoutes.demoHome,
      page: () => const DemoHomeView(),
      binding: DemoHomeBinding(),
    ),
  ];
}
