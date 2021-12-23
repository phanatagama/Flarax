import 'dart:io';
import 'package:flarax/app/core/utils/image_uploader.dart';
import 'package:flarax/app/core/values/constant.dart';
import 'package:flarax/app/modules/profile/controller/profile_controller.dart';
import 'package:flarax/app/modules/widgets/body.dart';
import 'package:flarax/app/modules/widgets/button_widget.dart';
import 'package:flarax/app/modules/widgets/profile_widget.dart';
import 'package:flarax/app/modules/profile/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfilePage extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Body(
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 32),
        physics: BouncingScrollPhysics(),
        children: [
          Obx(
            () => ProfileWidget(
              imagePath: controller.photoUrl.value,
              isEdit: true,
              onClicked: () async {
                XFile? file = await getImageFromGallery();
                String imagePath = await uploadImage(
                  File(file?.path ?? controller.photoUrl.value),
                );
                controller.photoUrl.value = imagePath;
              },
            ),
          ),
          const SizedBox(height: 24),
          TextFieldWidget(
            status: false,
            controller: controller.emailController,
            label: Const.EMAIL,
            text: "${controller.dataUser.value?.email}",
            onChanged: (email) {},
          ),
          const SizedBox(height: 24),
          TextFieldWidget(
            controller: controller.fullnameController,
            label: Const.FULLNAME,
            text: "${controller.dataUser.value?.fullname}",
            onChanged: (name) {},
          ),
          const SizedBox(height: 24),
          TextFieldWidget(
            controller: controller.phoneNumberController,
            label: Const.PHONE,
            text: "${controller.dataUser.value?.phoneNumber}",
            onChanged: (phone) {},
          ),
          const SizedBox(height: 24),
          Row(children: [
            Expanded(
                child: ButtonWidget(
                    text: Const.BACK, onClicked: () => Get.back())),
            SizedBox(
              width: 8,
            ),
            Expanded(
                child: ButtonWidget(
                    text: Const.SAVE,
                    onClicked: () {
                      ProfileController.updateUser(
                          uid: controller.dataUser.value!.uid,
                          email: controller.emailController.text.trim(),
                          fullname: controller.fullnameController.text.trim(),
                          phoneNumber:
                              controller.phoneNumberController.text.trim(),
                          photoUrl: controller.photoUrl.value);
                      Get.snackbar(
                        "Success",
                        "Profile has been Changed",
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    }))
          ])
        ],
      ),
    );
  }
}
