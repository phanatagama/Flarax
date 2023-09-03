import 'package:flarax/app/modules/home/binding/home_binding.dart';
import 'package:flarax/app/modules/home/home_page.dart';
import 'package:flarax/app/modules/login/binding/login_binding.dart';
import 'package:flarax/app/modules/login/login_page.dart';
import 'package:flarax/app/modules/message/binding/chat_binding.dart';
import 'package:flarax/app/modules/message/binding/message_binding.dart';
import 'package:flarax/app/modules/message/chat_page.dart';
import 'package:flarax/app/modules/message/message_page.dart';
import 'package:flarax/app/modules/message/widget/fullpage_widget.dart';
import 'package:flarax/app/modules/onboarding/binding/onboard_binding.dart';
import 'package:flarax/app/modules/onboarding/onboard_page.dart';
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
    GetPage(
        name: Routes.INITIAL,
        page: () => OnBoardingPage(),
        binding: OnBoardBinding(),
        transition: Transition.rightToLeftWithFade),
    GetPage(
        name: Routes.REGISTER,
        page: () => RegisterPage(),
        binding: RegisterBinding(),
        transition: Transition.rightToLeftWithFade),
    GetPage(
        name: Routes.LOGIN,
        page: () => LoginPage(),
        binding: LoginBinding(),
        transition: Transition.rightToLeftWithFade),
    GetPage(
        name: Routes.HOME,
        page: () => HomePage(),
        binding: HomeBinding(),
        transition: Transition.rightToLeftWithFade),
    GetPage(
        name: Routes.DETAILPRODUCT,
        page: () => DetailPage(),
        binding: DetailBinding(),
        transition: Transition.rightToLeftWithFade),
    GetPage(
        name: Routes.EDITPRODUCT,
        page: () => EditProductPage(),
        binding: EditProductBinding(),
        transition: Transition.rightToLeftWithFade),
    GetPage(
        name: Routes.POSTPRODUCT,
        page: () => PostPage(),
        binding: PostBinding(),
        transition: Transition.rightToLeftWithFade),
    GetPage(
        name: Routes.PRODUCT,
        page: () => ProductPage(),
        binding: ProductBinding(),
        transition: Transition.rightToLeftWithFade),
    GetPage(
        name: Routes.PROFILE,
        page: () => EditProfilePage(),
        binding: ProfileBinding(),
        transition: Transition.rightToLeftWithFade),
    GetPage(
        name: Routes.PHOTOVIEW,
        page: () => FullPhotoPage(),
        transition: Transition.rightToLeftWithFade),
    GetPage(
        name: Routes.CHAT,
        page: () => ChatPage(),
        binding: ChatBinding(),
        transition: Transition.rightToLeftWithFade),
    GetPage(
        name: Routes.MESSAGE,
        page: () => MessagePage(),
        binding: MessageBinding(),
        transition: Transition.rightToLeftWithFade)
  ];
}
