import 'package:flarax/app/core/values/constant.dart';
import 'package:flarax/app/modules/product/contoller/product_controller.dart';
import 'package:flarax/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget ownerBottomNavigation(String productId){
  return Row(children: [
    ElevatedButton(onPressed: () { 
      Get.back();
      ProductController.deleteProduct(productId: productId);
      }, 
    child: Text(Const.DELETE)),
    ElevatedButton(onPressed: () => Get.toNamed(Routes.EDITPRODUCT, arguments: productId), 
    child: Text(Const.EDIT))
  ],);
}