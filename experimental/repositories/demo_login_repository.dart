import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../models/demouser.dart';
import 'package:get/get.dart';
import '../services/demo_auth_service.dart';

class DemoLoginRepository extends RepositoryBase {
  static const String _password = "testtest";

  Future<DemoUser?> authentication(String email) async {
    try {
      UserCredential credential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: _password,
      );

      String? uid = credential.user?.uid;

      if (uid != null) {
        authService.uid.val = uid;
        debugPrint(authService.uid.val);
        return DemoUser(uid: uid);
      }
    } catch (e) {
      // nop
      Get.log(e.toString());
    }

    return null;
  }
}

class RepositoryBase {
  final DemoAuthService authService = Get.find();
}
