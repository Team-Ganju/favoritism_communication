import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'app/routes/app_pages.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshConfiguration(
      headerTriggerDistance: 80,
      footerTriggerDistance: 15,
      headerBuilder: () => const MaterialClassicHeader(),
      footerBuilder: () => const ClassicFooter(),
      child: GetMaterialApp(
        title: "FavoritismCommunication",
        localizationsDelegates: const [
          RefreshLocalizations.delegate,
          FormBuilderLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale("ja", "JP"),
        ],
        initialRoute: AppPages.initial,
        getPages: AppPages.routes,
      ),
    );
  }
}
