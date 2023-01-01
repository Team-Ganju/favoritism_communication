part of 'demo_app_pages.dart';
// DO NOT EDIT. This is code generated via package:get_cli/get_cli.dart

abstract class DemoRoutes {
  DemoRoutes._();
  static const demoHome = _DemoPaths.demoHome;
  static const demoLogin = _DemoPaths.demoLogin;
  static const demoUser = _DemoPaths.demoUser;
  static const demoUserCreate = _DemoPaths.demoUserCreate;
  static const demoUserUpdate = _DemoPaths.demoUserUpdate;
  static const demoUserDelete = _DemoPaths.demoUserDelete;
}

abstract class _DemoPaths {
  _DemoPaths._();
  static const demoHome = '/demoHome';
  static const demoLogin = '/demologin';
  static const demoUser = '/user';
  static const demoUserCreate = '$demoUser/create';
  static const demoUserUpdate = '$demoUser/update';
  static const demoUserDelete = '$demoUser/delete';
}
