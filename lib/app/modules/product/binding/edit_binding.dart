import 'package:flarax/app/modules/product/contoller/edit_controller.dart';
import 'package:get/get.dart';

class EditProductBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<EditProductController>(() => EditProductController());
  }
}