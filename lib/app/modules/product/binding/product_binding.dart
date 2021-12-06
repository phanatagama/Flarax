import 'package:flarax/app/modules/product/contoller/product_controller.dart';
import 'package:get/get.dart';

class ProductBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<ProductController>(() => ProductController());
  }
}