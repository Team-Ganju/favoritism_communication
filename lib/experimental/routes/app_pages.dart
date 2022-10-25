import 'package:favoritism_communication/experimental/pages/home/home_binding.dart';
import 'package:favoritism_communication/experimental/pages/home/home_view.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

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
