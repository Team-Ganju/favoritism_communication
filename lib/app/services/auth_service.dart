import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthService extends GetxService {
  ReadWriteValue<String> uid = ''.val('userId');
}
