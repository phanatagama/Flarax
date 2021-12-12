import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt current = 0.obs;
  CarouselController buttonCarouselController = CarouselController();
}