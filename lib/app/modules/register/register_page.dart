import 'package:flarax/app/core/utils/auth_helper.dart';
import 'package:flarax/app/core/values/colors.dart';
import 'package:flarax/app/core/values/constant.dart';
import 'package:flarax/app/modules/register/controller/register_controller.dart';
import 'package:flarax/app/modules/widgets/body.dart';
import 'package:flarax/app/modules/widgets/btn_gradient_widget.dart';
import 'package:flarax/app/modules/widgets/input_text_widget.dart';
import 'package:flarax/app/modules/widgets/title_auth_widget.dart';
import 'package:flarax/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class RegisterPage extends GetView<RegisterController>{
  @override
  Widget build(BuildContext context){
    return Body(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleAuth(title: Const.REGISTER),
          SizedBox(
            height: 22,
          ),
          InputText(
            controller: controller.fullnameController,
              label: Const.FULLNAME,
              hinttext: Const.FULLNAME,
              iconInput: null,
              password: false,
              width: (MediaQuery.of(context).size.width - 40),
          ),
          SizedBox(
            height: 15,
          ),
          InputText(
            controller: controller.addressController,
            label: Const.ADDRESS,
            hinttext: Const.ADDRESS,
            iconInput: Icon(Icons.search),
            password: false,
            width: MediaQuery.of(context).size.width - 40,
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Container(
                width: (MediaQuery.of(context).size.width - 72) / 2,
                child: TextField(
                  controller: controller.zipcodeController,
                  decoration: InputDecoration(
                    labelText: Const.ZIPCODE,
                    hintText: Const.ZIPCODE,
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    WhitelistingTextInputFormatter.digitsOnly
                  ], // Only numbers can be entered
                ),
              ),
              SizedBox(
                width: 8,
              ),
              InputText(
                controller: controller.cityController,
                label: Const.CITY,
                hinttext: Const.CITY,
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
            controller: controller.phoneController,
            label: Const.PHONE,
            hinttext: Const.HINTPHONE,
            iconInput: Icon(Icons.people),
            password: false,
            width: MediaQuery.of(context).size.width - 40,
          ),
          SizedBox(
            height: 15,
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
            height: 15,
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
            height: 48,
          ),
          Center(
            child: BtnGradient(
              text: Const.REGISTER.toUpperCase(),
              width: MediaQuery.of(context).size.width - 86,
              border: BorderRadius.circular(6),
              onPressed: () => authController.register(
                email: controller.emailController.text.trim(), 
                password: controller.passwordController.text.trim(),
                fullname: controller.fullnameController.text.trim(), 
                zipcode: controller.zipcodeController.text.trim(), 
                city: controller.cityController.text.trim(),
                address: controller.addressController.text.trim(),
                phoneNumber: controller.phoneController.text.trim())
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(Const.HAVEACCOUNT),
              GestureDetector(
                onTap: () => Get.offNamed(Routes.LOGIN),
                child: Text(
                  Const.SIGNIN,
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