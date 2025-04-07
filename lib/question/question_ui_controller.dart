import 'dart:ui';

import 'package:get/get.dart';

class QuestionUIController extends GetxController {
  final RxInt selectedQuestionIndex = 0.obs;
  final Rx<Offset> offset = Offset.zero.obs;

  void changeSelectedQuestionIndex(int index) {
    selectedQuestionIndex.value = index;
  }

  void changePosition({required Offset newOffset}) {
    offset.value += newOffset;
  }

  void initAnswerPosition({required Offset newOffset}) {
    offset.value = newOffset;
  }
}
