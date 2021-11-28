import 'package:flarax/app/core/utils/auth_helper.dart';
import 'package:flarax/app/core/values/colors.dart';
import 'package:flarax/app/modules/register/controller/register_controller.dart';
import 'package:flarax/app/modules/widgets/body.dart';
import 'package:flarax/app/modules/widgets/btn_gradient.dart';
import 'package:flarax/app/modules/widgets/input_text.dart';
import 'package:flarax/app/modules/widgets/title_auth.dart';
import 'package:flarax/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends GetView<RegisterController>{
  @override
  Widget build(BuildContext context){
    return Body(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleAuth(title: "Register"),
          SizedBox(
            height: 22,
          ),
          // InputText(
          //     label: 'NIK',
          //     hinttext: 'Nomor Induk Kependuduk',
          //     iconInput: Icon(Icons.people),
          //     password: false,
          //     width: MediaQuery.of(context).size.width - 40,
          // ),
          // SizedBox(
          //   height: 15,
          // ),
          Row(
            children: [
              InputText(
                controller: controller.fnameController,
                  label: 'First Name',
                  hinttext: 'First Name',
                  iconInput: null,
                  password: false,
                  width: (MediaQuery.of(context).size.width - 64)/2,
              ),
              SizedBox(
                width: 8,
              ),
              InputText(
                controller: controller.lnameController,
                  label: 'Last Name',
                  hinttext: 'Last Name',
                  iconInput: null,
                  password: false,
                  width: (MediaQuery.of(context).size.width - 64) / 2,
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          InputText(
            controller: controller.addressController,
            label: "Address",
            hinttext: "Address",
            iconInput: Icon(Icons.search),
            password: false,
            width: MediaQuery.of(context).size.width - 40,
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              InputText(
                controller: controller.zipcodeController,
                label: "ZipCode",
                hinttext: "Zip Code",
                iconInput: null,
                password: false,
                width: (MediaQuery.of(context).size.width - 72) / 2,
              ),
              SizedBox(
                width: 8,
              ),
              InputText(
                controller: controller.cityController,
                label: "City",
                hinttext: "City",
                iconInput: null,
                password: false,
                width: (MediaQuery.of(context).size.width - 72) / 2,
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          InputText(
            controller: controller.emailController,
            label: "E-mail address",
            hinttext: "e-mail",
            iconInput: Icon(Icons.email),
            password: false,
            width: MediaQuery.of(context).size.width - 40,
          ),
          SizedBox(
            height: 15,
          ),
          InputText(
            controller: controller.passwordController,
            label: "Password",
            hinttext: "Password",
            iconInput: Icon(Icons.lock),
            password: true,
            width: MediaQuery.of(context).size.width - 40,
          ),
          // SizedBox(
          //   height: 15,
          // ),
          // InputText(
          //   label: "Confirm Password",
          //   hinttext: "Confirm Password",
          //   iconInput: Icon(Icons.lock),
          //   password: true,
          //   width: MediaQuery.of(context).size.width - 40,
          // ),
          SizedBox(
            height: 48,
          ),
          Center(
            child: BtnGradient(
              text: "REGISTER",
              width: MediaQuery.of(context).size.width - 86,
              border: BorderRadius.circular(6),
              onPressed: () => authController.register(
                email: controller.emailController.text, 
                password: controller.passwordController.text,
                fname: controller.fnameController.text, 
                lname: controller.lnameController.text,
                zipcode: controller.zipcodeController.text, 
                city: controller.cityController.text,
                address: controller.addressController.text)
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Already have an Account ? "),
              GestureDetector(
                onTap: () => Get.offNamed(Routes.LOGIN),
                child: Text(
                  "Sign In",
                  style: TextStyle(
                    fontSize: 12,
                    color: blueColor,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}