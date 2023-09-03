import 'package:flarax/app/controller/auth_controller.dart';
import 'package:flarax/app/modules/profile/controller/profile_controller.dart';
import 'package:get/get.dart';

class ProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
