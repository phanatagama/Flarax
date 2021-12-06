import 'dart:io';
import 'package:flarax/app/core/utils/image_uploader.dart';
import 'package:flarax/app/core/values/constant.dart';
import 'package:flarax/app/modules/product/contoller/post_controller.dart';
import 'package:flarax/app/modules/product/contoller/product_controller.dart';
import 'package:flarax/app/modules/widgets/body.dart';
import 'package:flarax/app/modules/widgets/button_widget.dart';
import 'package:flarax/app/modules/widgets/input_text_widget.dart';
import 'package:flarax/app/modules/widgets/profile_widget.dart';
import 'package:flarax/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PostPage extends GetView<PostController>{
  @override
  Widget build(BuildContext context){
    return Body(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(() => ProfileWidget(
                  imagePath: controller.photoUrl.value,
                  isEdit: true,
                  onClicked: () async {
                    XFile? file = await getImageFromGallery();
                    String imagePath = await uploadImage(
                      File(file?.path ?? controller.photoUrl.value),
                    );
                    controller.photoUrl.value = imagePath;
                  },
                ),),
          SizedBox(
            height: 22,
          ),
          Row(
            children: [
              InputText(
                controller: controller.productNameController,
                  label: Const.NAME,
                  hinttext: Const.NAME,
                  iconInput: null,
                  password: false,
                  width: (MediaQuery.of(context).size.width - 64)/2,
              ),
              SizedBox(
                width: 8,
              ),
              InputText(
                controller: controller.productCategoryController,
                  label: Const.CATEGORY,
                  hinttext: Const.CATEGORY,
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
            controller: controller.productAddressController,
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
              InputText(
                controller: controller.productCityController,
                label: Const.CITY,
                hinttext: Const.CITY,
                iconInput: null,
                password: false,
                width: (MediaQuery.of(context).size.width - 72) / 2,
              ),
              SizedBox(
                width: 8,
              ),
              InputText(
                controller: controller.productProvinceController,
                label: Const.PROVINCE,
                hinttext: Const.PROVINCE,
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
            controller: controller.productDescriptionController,
              label: Const.DESCRIPTION,
              hinttext: Const.LOREM,
              iconInput: Icon(Icons.people),
              password: false,
              width: MediaQuery.of(context).size.width - 40,
          ),
          SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 48,
          ),
          Center(
            child: ButtonWidget(text: Const.POSTING, onClicked: () {
              ProductController.addProduct(
                productName: controller.productNameController.text.trim(), 
                productDescription: controller.productDescriptionController.text.trim(), 
                productCategory: controller.productCategoryController.text.trim(), 
                productPictureUrl: controller.photoUrl.value, 
                productProvince: controller.productProvinceController.text.trim(), 
                productCity: controller.productCityController.text.trim(), 
                productAddress: controller.productAddressController.text.trim());
                Get.offNamed(Routes.PRODUCT);
            })
          ),
        ],
      ),
    );
  }
}