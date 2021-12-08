import 'dart:io';
import 'package:flarax/app/core/utils/image_uploader.dart';
import 'package:flarax/app/core/values/constant.dart';
import 'package:flarax/app/modules/product/contoller/edit_controller.dart';
import 'package:flarax/app/modules/product/contoller/product_controller.dart';
import 'package:flarax/app/modules/widgets/body.dart';
import 'package:flarax/app/modules/widgets/button_widget.dart';
import 'package:flarax/app/modules/widgets/input_text_widget.dart';
import 'package:flarax/app/modules/widgets/profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProductPage extends GetView<EditProductController>{
  
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
              Expanded(child: InputText(
                controller: controller.productNameController,
                  label: Const.NAME,
                  hinttext: Const.NAME,
                  iconInput: null,
                  password: false,
                  width: (MediaQuery.of(context).size.width - 72)/2,
              ),),
              SizedBox(
                width: 8,
              ),
              Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Const.CATEGORY,
                style: TextStyle(
                  color: Colors.black.withOpacity(0.87),
                  fontSize: 14,
                ),
              ),
              Obx(() =>DropdownButton<String>(
                value: controller.chosenValue.value,
                elevation: 5,
                style: TextStyle(color: Colors.black),

                items: <String>[
                  ...Const.CATEGORYPRODUCT
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                hint: controller.chosenValue.value.isEmpty ? Text(
                  "Please choose a category",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ) : Text("${controller.chosenValue.value}"),
                onChanged: (choose) {
                  controller.chosenValue.value = choose!;
                },
              ))
            ],
          ),),
              
              // InputText(
              //   controller: controller.productCategoryController,
              //     label: Const.CATEGORY,
              //     hinttext: Const.CATEGORY,
              //     iconInput: null,
              //     password: false,
              //     width: (MediaQuery.of(context).size.width - 64) / 2,
              // ),
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
          Row(children: [
          Expanded(child: ButtonWidget(text: Const.CANCEL, onClicked: () => Get.back())),
          SizedBox(width: 8,),
          Expanded(child: ButtonWidget(text: Const.UPDATE, onClicked: () {
              ProductController.updateProduct(
                uid: controller.dataProduct.value!.uid,
                productId: Get.arguments,
                productStatus: controller.dataProduct.value!.productStatus,
                productName: controller.productNameController.text.trim(), 
                productDescription: controller.productDescriptionController.text.trim(), 
                productCategory: controller.chosenValue.value, 
                productPictureUrl: controller.photoUrl.value, 
                productProvince: controller.productProvinceController.text.trim(), 
                productCity: controller.productCityController.text.trim(), 
                productAddress: controller.productAddressController.text.trim());
                Get.back();
            }))
          ]),
          // Center(
          //   child: 
          // ),
        ],
      ),
    );
  }
}