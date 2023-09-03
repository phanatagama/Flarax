import 'package:flarax/app/core/values/colors.dart';
import 'package:flarax/app/core/values/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';

class FullPhotoPage extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Const.IMAGE,
          style: TextStyle(color: titleColor),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: PhotoView(
          imageProvider: NetworkImage(Get.arguments),
        ),
      ),
    );
  }
}
