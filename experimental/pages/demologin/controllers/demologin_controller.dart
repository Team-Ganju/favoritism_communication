import 'package:get/get.dart';
import '../../../models/demouser.dart';
import '../../../repositories/demologin_repository.dart';

class DemologinController extends GetxController {
  Future<DemoUser?> authentication(String email) async{
    return await DemologinRepository.authentication(email);
  }

}
