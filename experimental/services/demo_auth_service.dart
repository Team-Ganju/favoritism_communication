import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DemoAuthService extends GetxService {
  ReadWriteValue<String> uid = ''.val('userId');
}
