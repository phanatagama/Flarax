import 'package:flarax/app/modules/get_started/get_started.dart';
import 'package:flarax/app/modules/login/login_page.dart';
import 'package:flarax/app/modules/register/register_page.dart';
import 'package:get/get.dart';
part './app_routes.dart';

abstract class AppPages {

  static final pages = [
    GetPage(name: Routes.INITIAL, page:()=> GetStarted(),),
    GetPage(name: Routes.REGISTER, page:()=> RegisterPage(),),
    GetPage(name: Routes.LOGIN, page:()=> LoginPage(),)
  ];
}