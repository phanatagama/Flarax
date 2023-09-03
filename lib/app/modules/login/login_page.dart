import 'package:flarax/app/core/utils/auth_helper.dart';
import 'package:flarax/app/core/values/colors.dart';
import 'package:flarax/app/core/values/constant.dart';
import 'package:flarax/app/modules/login/controller/login_controller.dart';
import 'package:flarax/app/modules/widgets/body.dart';
import 'package:flarax/app/modules/widgets/btn_gradient_widget.dart';
import 'package:flarax/app/modules/widgets/input_text_widget.dart';
import 'package:flarax/app/modules/widgets/title_auth_widget.dart';
import 'package:flarax/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Body(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleAuth(title: Const.LOGIN),
          SizedBox(
            height: 48,
          ),
          InputText(
            controller: controller.emailController,
            label: Const.EMAIL,
            hinttext: Const.HINTEMAIL,
            iconInput: Icon(Icons.email),
            password: false,
            width: MediaQuery.of(context).size.width - 40,
          ),
          SizedBox(
            height: 32,
          ),
          InputText(
            controller: controller.passwordController,
            label: Const.PASSWORD,
            hinttext: Const.PASSWORD,
            iconInput: Icon(Icons.lock),
            password: true,
            width: MediaQuery.of(context).size.width - 40,
          ),
          SizedBox(
            height: 64,
          ),
          Center(
            child: BtnGradient(
              text: Const.LOGIN.toUpperCase(),
              width: MediaQuery.of(context).size.width - 86,
              border: BorderRadius.circular(6),
              onPressed: () => authController.login(
                  controller.emailController.text.trim(),
                  controller.passwordController.text.trim()),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(Const.DONTHAVEACCOUNT),
              GestureDetector(
                onTap: () => Get.offNamed(Routes.REGISTER),
                child: Text(
                  Const.CREATEONE,
                  style: TextStyle(
                    fontSize: 12,
                    color: blueColor,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 36,
          ),
          Center(
            child: BtnGradient(
              text: Const.GOOGLESIGNIN,
              width: MediaQuery.of(context).size.width - 86,
              border: BorderRadius.circular(6),
              onPressed: () => authController.signInWithGoogle(),
            ),
          ),
        ],
      ),
    );
  }
}
