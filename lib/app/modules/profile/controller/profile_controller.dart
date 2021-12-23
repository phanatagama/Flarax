import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flarax/app/core/utils/auth_helper.dart';
import 'package:flarax/app/core/values/constant.dart';
import 'package:flarax/app/data/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  TextEditingController fullnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  RxString photoUrl = Const.PHOTOURL.obs;
  late Rxn<UserModel> dataUser = Rxn<UserModel>();

  @override
  void onInit() async {
    super.onInit();
    dataUser.value = await authController.firestoreUser.value;
    fullnameController.text = dataUser.value!.fullname;
    emailController.text = dataUser.value!.email;
    phoneNumberController.text = dataUser.value!.phoneNumber;
    photoUrl.value = dataUser.value!.photoUrl;
  }

  static CollectionReference userCollection =
      firebaseFirestore.collection(Const.PATHUSERCOLLECTION);

  static Future<void> updateUser({
    required uid,
    required email,
    required fullname,
    required phoneNumber,
    required photoUrl,
    chattingWith = null,
  }) async {
    UserModel newUser = UserModel(
      uid: uid,
      email: email,
      fullname: fullname,
      photoUrl: photoUrl,
      phoneNumber: phoneNumber,
      chattingWith: chattingWith,
    );
    await userCollection.doc(uid).update(newUser.toJson());
  }
}
