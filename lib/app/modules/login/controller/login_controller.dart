import 'package:flarax/app/core/utils/auth_helper.dart';
import 'package:flarax/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void onInit() async {
    super.onInit();
    if (await authController.isLoggedIn()) {
      return Get.offAllNamed(Routes.HOME);
    }
  }
}
