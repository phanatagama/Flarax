import 'package:flarax/app/data/provider/home_provider.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {

final HomeProvider provider;
HomeController(this.provider);

  final _obj = ''.obs;
  set obj(value) => this._obj.value = value;
  get obj => this._obj.value;
}