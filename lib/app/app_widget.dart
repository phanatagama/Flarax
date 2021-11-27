import 'package:flarax/app/core/theme/app_theme.dart';
import 'package:flarax/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.INITIAL,
        title: 'Flarax',
        theme: appThemeData,
        defaultTransition: Transition.fade,
        // initialBinding: SplashBinding(),
        getPages: AppPages.pages,
        // home: GetStarted(),
    );
  }
}