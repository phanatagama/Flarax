import 'package:flarax/app/data/provider/home_provider.dart';
import 'package:flarax/app/modules/home/controller/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<HomeController>(() => HomeController(
     HomeProvider()));
  }
}