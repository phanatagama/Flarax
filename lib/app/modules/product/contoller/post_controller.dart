import 'package:flarax/app/core/values/constant.dart';
import 'package:flarax/app/modules/product/contoller/product_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PostController extends ProductController {
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController productDescriptionController = TextEditingController();
  final TextEditingController productAddressController = TextEditingController();
  final TextEditingController productCityController = TextEditingController();
  final TextEditingController productProvinceController = TextEditingController();
  final TextEditingController productCategoryController = TextEditingController();
  RxString photoUrl = Const.PHOTOURL.obs;
}