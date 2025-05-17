import 'package:get/get.dart';
import 'package:my/question/question_ui_controller.dart';
import 'package:my/travel/travel_main_ui_controller.dart';

class QuestionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuestionUIController>(() => QuestionUIController());
    Get.lazyPut<TravelMainUIController>(() => TravelMainUIController());
  }
}
