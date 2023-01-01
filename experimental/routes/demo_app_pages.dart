import 'package:get/get.dart';

import '../pages/demo_login/bindings/demo_login_binding.dart';
import '../pages/demo_login/views/demo_login_view.dart';
import '../pages/demo_home/bindings/demo_home_binding.dart';
import '../pages/demo_home/views/demo_home_view.dart';
import '../pages/demo_user/bindings/demo_user_binding.dart';
import '../pages/demo_user/views/views.dart';
part 'demo_app_routes.dart';

class DemoAppPages {
  DemoAppPages._();

  static const initial = DemoRoutes.demoLogin;

  static final routes = [
    GetPage(
      name: _DemoPaths.demoHome,
      page: () => const DemoHomeView(),
      binding: DemoHomeBinding(),
    ),
    GetPage(
      name: _DemoPaths.demoLogin,
      page: () => DemoLoginView(),
      binding: DemoLoginBinding(),
    ),
    GetPage(
      name: _DemoPaths.demoUser,
      page: () => const DemoUserIndexView(),
      binding: DemoUserBinding(),
    ),
    GetPage(
      name: _DemoPaths.demoUserCreate,
      page: () => const DemoUserCreateView(),
      binding: DemoUserBinding(),
    ),
    GetPage(
      name: _DemoPaths.demoUserUpdate,
      page: () => const DemoUserUpdateView(),
      binding: DemoUserBinding(),
    ),
    GetPage(
      name: _DemoPaths.demoUserDelete,
      page: () => const DemoUserDeleteView(),
      binding: DemoUserBinding(),
    ),
  ];
}
