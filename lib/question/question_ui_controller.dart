import 'package:get/get.dart';

class QuestionUIController extends GetxController {
  final RxInt selectedQuestionIndex = 0.obs;
  final RxDouble positionX = 0.0.obs;
  final RxDouble positionY = 0.0.obs;

  void changeSelectedQuestionIndex(int index) {
    selectedQuestionIndex.value = index;
  }

  void changePosition({
    required double x,
    required double y,
  }) {
    positionX.value += x;
    positionY.value += y;
  }

  void initAnswerPosition({
    required double x,
    required double y,
  }) {
    positionX.value = x;
    positionY.value = y;
  }
}
