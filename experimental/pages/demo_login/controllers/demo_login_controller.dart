import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import '../../../models/demouser.dart';
import '../../../repositories/demo_login_repository.dart';

class DemoLoginController extends GetxController {
  DemoLoginRepository repository = Get.find();

  Future<DemoUser?> authentication(String email) async {
    return await repository.authentication(email);
  }
}
