import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class DemologinController extends GetxController {

  Future<User?> authentication(String email) async{
    UserCredential credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: "testtest");
    return credential.user;
  }

}
