import 'package:get/get.dart';
import '../../../models/demouser.dart';
import '../../../repositories/demo_login_repository.dart';

class DemoLoginController extends GetxController {
  Future<DemoUser?> authentication(String email) async {
    return await DemoLoginRepository.authentication(email);
  }
}
