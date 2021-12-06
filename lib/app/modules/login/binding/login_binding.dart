import 'package:flarax/app/controller/auth_controller.dart';
import 'package:flarax/app/modules/login/controller/login_controller.dart';
import 'package:get/get.dart';

class LoginBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<LoginController>(() => LoginController());
  Get.lazyPut<AuthController>(() => AuthController());
  }
}
