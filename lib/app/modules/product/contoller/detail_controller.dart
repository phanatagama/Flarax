import 'package:flarax/app/core/utils/auth_helper.dart';
import 'package:flarax/app/modules/product/contoller/product_controller.dart';
import 'package:get/get.dart';

class DetailController extends GetxController {
  RxBool isMyProduct = false.obs;
  checkIsMyProduct(String id) async {
    var uid = await auth.currentUser?.uid;
    var doc = await ProductController.getProductDataWithIdFuture(id);
    isMyProduct.value = doc.get('uid') == uid ? true : false;
  }
}