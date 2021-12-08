import 'package:flarax/app/modules/product/contoller/post_controller.dart';
import 'package:get/get.dart';

class PostBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<PostController>(() => PostController());
  }
}
