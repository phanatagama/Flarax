import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flarax/app/core/utils/auth_helper.dart';
import 'package:flarax/app/core/values/constant.dart';
import 'package:flarax/app/data/models/user_model.dart';
import 'package:flarax/app/modules/product/contoller/product_controller.dart';
import 'package:get/get.dart';

class DetailController extends GetxController {
  RxBool isMyProduct = false.obs;
  Rx<UserModel> userChat = Const.userDummy.obs;

  checkIsMyProduct(String id) async {
    var uid = await auth.currentUser?.uid;
    var doc = await ProductController.getProductDataWithIdFuture(id);
    isMyProduct.value = doc.get('uid') == uid ? true : false;
  }

  @override
  void onInit() async {
    super.onInit();
    var doc = await ProductController.getProductDataWithIdFuture(Get.arguments);
    DocumentSnapshot snapshots = await getUserDataWithIdFuture(doc.get('uid'));
    Map<String, dynamic> dataUser = snapshots.data() as Map<String, dynamic>;
    userChat.value = UserModel.fromMap(dataUser);
  }

  Future<DocumentSnapshot> getUserDataWithIdFuture(String id) async {
    return await firebaseFirestore
        .collection(Const.PATHUSERCOLLECTION)
        .doc(id)
        .get();
  }
}
