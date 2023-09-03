import 'package:flarax/app/core/values/constant.dart';
import 'package:flarax/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnBoardController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    GetStorage prefs = GetStorage();
    bool isFirstLaunch = prefs.read(Const.ONBOARD) ?? true;
    if (!isFirstLaunch) {
      return Get.offAllNamed(Routes.LOGIN);
    } else {
      prefs.write(Const.ONBOARD, false);
    }
  }
}
