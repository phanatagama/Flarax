import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flarax/app/core/utils/auth_helper.dart';
import 'package:flarax/app/core/values/constant.dart';
import 'package:flarax/app/data/models/message_model.dart';
import 'package:flarax/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ChatController extends GetxController {
  late String currentUserId;
  String peerId = Get.arguments[0];
  String peerAvatar = Get.arguments[1];
  String peerNickname = Get.arguments[2];

  List<QueryDocumentSnapshot> listMessage = [];
  RxInt limit = 20.obs;
  RxInt limitIncrement = 20.obs;
  RxString groupChatId = "".obs;

  RxBool isLoading = false.obs;
  RxBool isShowSticker = false.obs;
  String imageUrl = "";

  final TextEditingController textEditingController = TextEditingController();
  final ScrollController listScrollController = ScrollController();
  final FocusNode focusNode = FocusNode();

  @override
  void onInit() {
    super.onInit();

    focusNode.addListener(onFocusChange);
    listScrollController.addListener(_scrollListener);
    readLocal();
  }

  _scrollListener() {
    if (listScrollController.offset >=
            listScrollController.position.maxScrollExtent &&
        !listScrollController.position.outOfRange &&
        limit <= listMessage.length) {
      limit += limitIncrement.value;
    }
  }

  void onFocusChange() {
    if (focusNode.hasFocus) {
      // Hide sticker when keyboard appear
      isShowSticker.value = false;
    }
  }

  void readLocal() {
    if (auth.currentUser?.uid.isNotEmpty == true) {
      currentUserId = auth.currentUser!.uid;
    } else {
      Get.offAllNamed(Routes.LOGIN);
    }
    if (currentUserId.compareTo(peerId) > 0) {
      groupChatId.value = '$currentUserId-$peerId';
    } else {
      groupChatId.value = '$peerId-$currentUserId';
    }

    ChatController.updateDataFirestore(
      Const.PATHUSERCOLLECTION,
      currentUserId,
      {Const.CHATTINGWITH: peerId},
    );
  }

  String? getPref(String key) {
    return GetStorage().read(key);
  }

  static Future<void> updateDataFirestore(String collectionPath, String docPath,
      Map<String, dynamic> dataNeedUpdate) {
    return firebaseFirestore
        .collection(collectionPath)
        .doc(docPath)
        .update(dataNeedUpdate);
  }

  static Stream<QuerySnapshot> getChatStream(String groupChatId, int limit) {
    return firebaseFirestore
        .collection(Const.PATHMESSAGECOLLECTION)
        .doc(groupChatId)
        .collection(groupChatId)
        .orderBy(Const.TIMESTAMP, descending: true)
        .limit(limit)
        .snapshots();
  }

  static void sendMessage(String content, int type, String groupChatId,
      String currentUserId, String peerId) {
    DocumentReference documentReference = firebaseFirestore
        .collection(Const.PATHMESSAGECOLLECTION)
        .doc(groupChatId)
        .collection(groupChatId)
        .doc(DateTime.now().millisecondsSinceEpoch.toString());

    MessageChat messageChat = MessageChat(
      idFrom: currentUserId,
      idTo: peerId,
      timestamp: DateTime.now().millisecondsSinceEpoch.toString(),
      content: content,
      type: type,
    );

    FirebaseFirestore.instance.runTransaction((transaction) async {
      transaction.set(
        documentReference,
        messageChat.toJson(),
      );
    });
  }
}

class TypeMessage {
  static const text = 0;
  static const image = 1;
  static const sticker = 2;
}
