
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:my/question/question_ui_controller.dart';

void main() {
  group('test question controller', () {
    final questionUIController = Get.put(QuestionUIController());
    test(('답변 리스트 중 선택된 index 확인'), () {
      // given
      final selectedIndex = 1;

      // when
      questionUIController.changeSelectedQuestionIndex(selectedIndex);

      // then
      expect(questionUIController.selectedQuestionIndex.value, selectedIndex);
    });

    test(('답변 floating 초기 위치 Offset(100,100) 설정 확인'), () {
      // given
      final Offset newOffset = Offset(100, 100);

      // when
      questionUIController.initAnswerPosition(newOffset: newOffset);

      // then
      expect(questionUIController.offset.value, newOffset);
    });

    test(('답변 floating 위젯 위치 Offset zero에서 오프셋 20, 20으로 이동 시 Offset(20,20)으로 이동한다.'), () {
      // given
      final Offset newOffset = Offset(20, 20);

      // when
      questionUIController.initAnswerPosition(newOffset: Offset(0, 0));
      questionUIController.changePosition(newOffset: newOffset);

      // then
      expect(questionUIController.offset.value, newOffset);
    });
  });
}
