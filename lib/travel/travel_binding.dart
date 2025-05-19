import 'package:get/get.dart';
import 'package:my/travel/travel_main_ui_controller.dart';
import 'package:my/travel/travel_detail_ui_controller.dart';

class TravelBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TravelMainUIController>(() => TravelMainUIController());
  }
}

class TravelDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TravelMainUIController>(() => TravelMainUIController());
    Get.lazyPut<TravelDetailUIController>(() => TravelDetailUIController());
  }
}
