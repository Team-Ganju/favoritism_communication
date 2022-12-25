import 'package:favoritism_communication/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'bindings/demo_initial_bindings.dart';
import 'routes/demo_app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await GetStorage.init();
  if (kDebugMode) {
    try {
      await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
      print("エミュレーターの設定が完了しました。");
    } catch (e) {
      print("エミュレーターの設定に失敗しました。: ${e.toString()}");
    }
  }
  runApp(const DemoApp());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class DemoApp extends StatelessWidget {
  const DemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "DemoApp",
      localizationsDelegates: const [
        FormBuilderLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale("ja", "JP"),
      ],
      initialRoute: DemoAppPages.initial,
      getPages: DemoAppPages.routes,
      initialBinding: DemoInitialBinding(),
    );
  }
}
