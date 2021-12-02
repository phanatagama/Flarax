import 'package:flarax/app/modules/get_started/get_started.dart';
import 'package:flarax/app/modules/home/binding/home_binding.dart';
import 'package:flarax/app/modules/home/home_page.dart';
import 'package:flarax/app/modules/login/binding/login_binding.dart';
import 'package:flarax/app/modules/login/login_page.dart';
import 'package:flarax/app/modules/profile/binding/profile_binding.dart';
import 'package:flarax/app/modules/profile/profile_page.dart';
import 'package:flarax/app/modules/register/binding/regiser_binding.dart';
import 'package:flarax/app/modules/register/register_page.dart';
import 'package:get/get.dart';
part './app_routes.dart';

abstract class AppPages {

  static final pages = [
    GetPage(name: Routes.INITIAL, page:()=> GetStarted(),),
    GetPage(name: Routes.REGISTER, page:()=> RegisterPage(), binding: RegisterBinding()),
    GetPage(name: Routes.LOGIN, page:()=> LoginPage(), binding: LoginBinding()),
    GetPage(name: Routes.HOME, page:()=> HomePage(), binding: HomeBinding()),
    GetPage(name: Routes.PROFILE, page:()=> EditProfilePage(), binding: ProfileBinding())
  ];
}