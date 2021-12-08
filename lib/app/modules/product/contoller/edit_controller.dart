import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flarax/app/core/values/constant.dart';
import 'package:flarax/app/data/models/product_model.dart';
import 'package:flarax/app/modules/product/contoller/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProductController extends ProductController {
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController productDescriptionController = TextEditingController();
  final TextEditingController productAddressController = TextEditingController();
  final TextEditingController productCityController = TextEditingController();
  final TextEditingController productProvinceController = TextEditingController();
  RxString chosenValue = Const.CATEGORYPRODUCT[0].obs;
  RxString photoUrl = Const.PHOTOURL.obs;
  late Rxn<ProductModel> dataProduct = Rxn<ProductModel>();

  getDataProduct() async{
    DocumentSnapshot snapshots = await ProductController.getProductDataWithIdFuture(Get.arguments);
    Map <String, dynamic> dataProduct = snapshots.data() as Map<String, dynamic>;
    return ProductModel.fromMap(dataProduct);
  }

  @override
  void onInit() async{
    super.onInit();
    dataProduct.value = await getDataProduct();
    setDataToField();
  }

  setDataToField() {
    productNameController.text = dataProduct.value!.productName;
    productDescriptionController.text = dataProduct.value!.productDescription;
    productCityController.text = dataProduct.value!.productCity;
    productProvinceController.text = dataProduct.value!.productProvince;
    productAddressController.text = dataProduct.value!.productAddress;
    chosenValue.value = dataProduct.value!.productCategory;
    photoUrl.value = dataProduct.value!.productPictureUrl;
  }
}