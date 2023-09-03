import 'package:flarax/app/modules/onboarding/controller/onboard_controller.dart';
import 'package:flarax/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingPage extends GetView<OnBoardController> {
  List<PageViewModel> listPages() {
    return [
      PageViewModel(
        image:
            Image.asset('assets/slider_get/undraw_Posting_photo_re_plk8.png'),
        title: ('Buat Postingan'),
        body:
            'Posting barang bekas anda dan tunggu seseorang mengambilnya di rumah!',
        footer: Image.asset(
          'assets/slider_get/755 [Converted]-01.png',
          height: 23,
        ),
      ),
      PageViewModel(
        image:
            Image.asset('assets/slider_get/undraw_People_search_re_5rre.png'),
        title: 'Cari Barang Bekas',
        body:
            'Temukan barang bekas layak pakai yang anda butuhkan dengan mudah dan cepat!',
        footer: Image.asset(
          'assets/slider_get/755 [Converted]-01.png',
          height: 23,
        ),
      ),
      PageViewModel(
        image: Image.asset('assets/slider_get/undraw_deliveries_131a.png'),
        title: 'Informasi Barang Bekas',
        body:
            'Nikmati kemudahan mengakses informasi barang bekas layak pakai disekitar anda!',
        footer: Image.asset(
          'assets/slider_get/755 [Converted]-01.png',
          height: 23,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        skipFlex: 0,
        nextFlex: 0,
        skip: Text('Skip', style: Theme.of(context).textTheme.bodyText1!),
        next: const Icon(
          Icons.arrow_forward,
        ),
        done: Text('Done', style: Theme.of(context).textTheme.bodyText1!),
        showSkipButton: true,
        showDoneButton: true,
        controlsMargin: const EdgeInsets.all(16),
        controlsPadding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
        pages: listPages(),
        onDone: () {
          Get.offNamed(Routes.LOGIN);
        },
        dotsDecorator: const DotsDecorator(
          size: Size(10, 10),
          activeSize: Size(40, 10),
          color: Color(0xff56CCF2),
          activeColor: Color(0xff0F9DED),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
        ),
        dotsContainerDecorator: const ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
        ),
      ),
    );
  }
}
