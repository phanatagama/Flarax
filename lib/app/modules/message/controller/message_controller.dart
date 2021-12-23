import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flarax/app/core/utils/auth_helper.dart';
import 'package:flarax/app/core/utils/debouncer.dart';
import 'package:flarax/app/core/values/constant.dart';
import 'package:flarax/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageController extends GetxController {
  RxInt limit = 20.obs;
  RxInt limitIncrement = 20.obs;
  RxBool isLoading = false.obs;
  final ScrollController listScrollController = ScrollController();
  Debouncer searchDebouncer = Debouncer(milliseconds: 300);
  StreamController<bool> btnClearController = StreamController<bool>();
  late String currentUserId;
  TextEditingController searchBarTec = TextEditingController();
  RxString keyword = "".obs;
  final items = [].obs;
  final itemsAfterFilter = [].obs;

  void filterUser() {
    itemsAfterFilter.value = [];
    itemsAfterFilter.value = items
        .where((item) =>
            item["fullname"].toLowerCase().contains(keyword.toLowerCase()))
        .toList();
    itemsAfterFilter.refresh();
  }

  @override
  void onInit() {
    super.onInit();

    if (auth.currentUser!.uid.isNotEmpty == true) {
      currentUserId = auth.currentUser!.uid;
    } else {
      Get.offAllNamed(Routes.LOGIN);
    }
    listScrollController.addListener(scrollListener);
  }

  @override
  void onClose() {
    super.onClose();
    btnClearController.close();
  }

  void scrollListener() {
    if (listScrollController.offset >=
            listScrollController.position.maxScrollExtent &&
        !listScrollController.position.outOfRange) {
      limit += limitIncrement.value;
    }
  }

  static Future<void> updateDataFirestore(
      String collectionPath, String path, Map<String, String> dataNeedUpdate) {
    return firebaseFirestore
        .collection(collectionPath)
        .doc(path)
        .update(dataNeedUpdate);
  }
  // static getChatUserStream() async {
  //   var data = await firebaseFirestore.collection(Const.PATHMESSAGECOLLECTION).get();
  //   if (data.docs.isNotEmpty){
  //     return data.docs.where((element) => element.id.contains(auth.currentUser!.uid));
  //   }
  // }

  static Stream<QuerySnapshot> getStreamFireStore(
      String pathCollection, int limit, String? textSearch) {
    if (textSearch?.isNotEmpty == true) {
      return firebaseFirestore
          .collection(pathCollection)
          .limit(limit)
          .where(Const.NAME, isEqualTo: textSearch)
          .snapshots();
    } else {
      return firebaseFirestore
          .collection(pathCollection)
          .limit(limit)
          .snapshots();
    }
  }
}
