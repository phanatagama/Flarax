import 'package:flarax/app/core/theme/app_theme.dart';
import 'package:flarax/app/core/values/constant.dart';
import 'package:flarax/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

GetStorage prefs = GetStorage();

// ignore: must_be_immutable
class AppWidget extends GetView {
  bool isFirstLaunch = prefs.read(Const.ONBOARD) ?? true;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: isFirstLaunch ? Routes.INITIAL : Routes.LOGIN,
      title: Const.FLARAX,
      theme: appThemeData,
      defaultTransition: Transition.fade,
      getPages: AppPages.pages,
    );
  }
}
