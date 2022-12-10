import 'package:firebase_auth/firebase_auth.dart';
import '../models/demouser.dart';

class DemologinRepository {
  static const String _password = "testtest";

  static Future<DemoUser?> authentication(String email) async {
    try {
      UserCredential credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: _password);
      String? uid = credential.user?.uid;

      if (uid != null){
        return DemoUser(uid: uid);
      }
    }
    catch (e) {
      // nop
    }

    return null;
  }
}
