import 'package:flarax/app/core/utils/auth_helper.dart';
import 'package:flarax/app/core/values/colors.dart';
import 'package:flarax/app/modules/login/controller/login_controller.dart';
import 'package:flarax/app/modules/widgets/body.dart';
import 'package:flarax/app/modules/widgets/btn_gradient.dart';
import 'package:flarax/app/modules/widgets/input_text.dart';
import 'package:flarax/app/modules/widgets/title_auth.dart';
import 'package:flarax/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class LoginPage extends GetView<LoginController>{
  @override
  Widget build(BuildContext context){
    return Body(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleAuth(title: 'Login'),
          SizedBox(
            height: 48,
          ),
          InputText(
            controller: controller.emailController,
            label: "E-mail adddress",
            hinttext: "e-mail",
            iconInput: Icon(Icons.email),
            password: false,
            width: MediaQuery.of(context).size.width - 40,
          ),
          SizedBox(
            height: 32,
          ),
          InputText(
            controller: controller.passwordController,
            label: "Password",
            hinttext: "your password",
            iconInput: Icon(Icons.lock),
            password: true,
            width: MediaQuery.of(context).size.width - 40,
          ),
          SizedBox(
            height: 64,
          ),
          Center(
            child: BtnGradient(
              text: "LOGIN",
              width: MediaQuery.of(context).size.width - 86,
              border: BorderRadius.circular(6),
              onPressed: () async => authController.login(controller.emailController.text, controller.passwordController.text),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Don’t have an Account ? "),
              GestureDetector(
                onTap: () => Get.offNamed(Routes.REGISTER),
                child: Text(
                  "Create one",
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
              text: "Sign with Google",
              width: MediaQuery.of(context).size.width - 86,
              border: BorderRadius.circular(6),
              onPressed: () async => authController.signInWithGoogle(),
            ),
          ),

        ],
      ),
    );
  }
}
