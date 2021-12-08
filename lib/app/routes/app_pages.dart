import 'package:flarax/app/modules/get_started/get_started.dart';
import 'package:flarax/app/modules/home/binding/home_binding.dart';
import 'package:flarax/app/modules/home/home_page.dart';
import 'package:flarax/app/modules/login/binding/login_binding.dart';
import 'package:flarax/app/modules/login/login_page.dart';
import 'package:flarax/app/modules/product/binding/detail_binding.dart';
import 'package:flarax/app/modules/product/binding/edit_binding.dart';
import 'package:flarax/app/modules/product/binding/post_binding.dart';
import 'package:flarax/app/modules/product/binding/product_binding.dart';
import 'package:flarax/app/modules/product/detail_page.dart';
import 'package:flarax/app/modules/product/edit_page.dart';
import 'package:flarax/app/modules/product/post_page.dart';
import 'package:flarax/app/modules/product/product_page.dart';
import 'package:flarax/app/modules/profile/binding/profile_binding.dart';
import 'package:flarax/app/modules/profile/profile_page.dart';
import 'package:flarax/app/modules/register/binding/register_binding.dart';
import 'package:flarax/app/modules/register/register_page.dart';
import 'package:get/get.dart';
part './app_routes.dart';

abstract class AppPages {

  static final pages = [
    GetPage(name: Routes.INITIAL, page:()=> GetStarted(),),
    GetPage(name: Routes.REGISTER, page:()=> RegisterPage(), binding: RegisterBinding()),
    GetPage(name: Routes.LOGIN, page:()=> LoginPage(), binding: LoginBinding()),
    GetPage(name: Routes.HOME, page:()=> HomePage(), binding: HomeBinding()),
    GetPage(name: Routes.DETAILPRODUCT, page:()=> DetailPage(), binding: DetailBinding()),
    GetPage(name: Routes.EDITPRODUCT, page:()=> EditProductPage(), binding: EditProductBinding()),
    GetPage(name: Routes.POSTPRODUCT, page:()=> PostPage(), binding: PostBinding()),
    GetPage(name: Routes.PRODUCT, page:()=> ProductPage(), binding: ProductBinding()),
    GetPage(name: Routes.PROFILE, page:()=> EditProfilePage(), binding: ProfileBinding())
  ];
}