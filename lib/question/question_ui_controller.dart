import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:my/question/question_vo.dart';

class QuestionUIController extends GetxController
    with GetSingleTickerProviderStateMixin {
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
