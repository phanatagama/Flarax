import 'package:flarax/app/core/values/colors.dart';
import 'package:flarax/app/modules/widgets/body.dart';
import 'package:flarax/app/modules/widgets/btn_gradient.dart';
import 'package:flarax/app/modules/widgets/input_text.dart';
import 'package:flarax/app/modules/widgets/title_auth.dart';
import 'package:flarax/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget{
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
          InputText(
              label: 'NIK',
              hinttext: 'Nomor Induk Kependuduk',
              iconInput: Icon(Icons.people),
              password: false,
              width: MediaQuery.of(context).size.width - 40,
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              InputText(
                  label: 'First Name',
                  hinttext: 'First Name',
                  iconInput: null,
                  password: false,
                  width: (MediaQuery.of(context).size.width - 50)/2,
              ),
              SizedBox(
                width: 10,
              ),
              InputText(
                  label: 'Last Name',
                  hinttext: 'Last Name',
                  iconInput: null,
                  password: false,
                  width: (MediaQuery.of(context).size.width - 50) / 2,
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          InputText(
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
                label: "ZipCode",
                hinttext: "Zip Code",
                iconInput: null,
                password: false,
                width: (MediaQuery.of(context).size.width - 60) / 2,
              ),
              SizedBox(
                width: 10,
              ),
              InputText(
                label: "City",
                hinttext: "City",
                iconInput: null,
                password: false,
                width: (MediaQuery.of(context).size.width - 60) / 2,
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
            label: "Password",
            hinttext: "Password",
            iconInput: Icon(Icons.lock),
            password: true,
            width: MediaQuery.of(context).size.width - 40,
          ),
          SizedBox(
            height: 15,
          ),
          InputText(
            label: "Confirm Password",
            hinttext: "Confirm Password",
            iconInput: Icon(Icons.lock),
            password: true,
            width: MediaQuery.of(context).size.width - 40,
          ),
          SizedBox(
            height: 47,
          ),
          Center(
            child: BtnGradient(
              text: Text(
                "REGISTER",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              width: MediaQuery.of(context).size.width - 86,
              border: BorderRadius.circular(6),
              proses: () => Get.offNamed(Routes.LOGIN),
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
                  "Sign Up",
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