
import 'package:flarax/app/controller/auth_controller.dart';
import 'package:get/get.dart';

class RegisterBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<AuthController>(() => AuthController());
  }
}