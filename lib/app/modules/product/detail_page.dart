import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flarax/app/core/values/constant.dart';
import 'package:flarax/app/modules/product/contoller/detail_controller.dart';
import 'package:flarax/app/modules/product/contoller/product_controller.dart';
import 'package:flarax/app/modules/product/widgets/contact_owner_widget.dart';
import 'package:flarax/app/modules/product/widgets/owner_bottom_navigation_widget.dart';
import 'package:flarax/app/modules/product/widgets/product_detail_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailPage extends GetView<DetailController> {
  @override
  Widget build(BuildContext context) {
    controller.checkIsMyProduct(Get.arguments);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Get.back(result: false);
          },
        ),
        title: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(5)),
          child: Center(
            child: TextField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: Const.HINTSEARCHPRODUCT,
                border: InputBorder.none,
              ),
              onTap: () {
                Get.back(result: true);
              },
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: StreamBuilder(
          stream: ProductController.getProductDataWithId(Get.arguments),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            } else {
              if (snapshot.data!.exists) {
                return Obx(() =>
                    productDetail(context, snapshot.data, controller.userChat));
              }
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
        child: Obx(() => controller.isMyProduct.value
            ? ownerBottomNavigation(Get.arguments)
            : contactOwner(context, controller.userChat)),
      ),
    );
  }
}
