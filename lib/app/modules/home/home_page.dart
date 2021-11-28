import 'package:flarax/app/core/utils/auth_helper.dart';
import 'package:flarax/app/modules/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
    appBar: AppBar(title: Text('MyPage')),

    body: SafeArea(
      child: Text('${authController.firestoreUser.value!.firstname}') )
    );
  }
}