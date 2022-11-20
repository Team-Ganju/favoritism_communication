import 'package:get/get.dart';

class ProfileController extends GetxController {
  ProfileController({required this.userName});

  final count = 0.obs;
  final String userName;

  void increment() => count.value++;
}
