import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my/question/question_ui_controller.dart';
import 'package:my/question/question_vo.dart';
import 'package:my/util/size.dart';


class QuestionScreen extends StatelessWidget {
  const QuestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return QuestionView();
  }
}

class QuestionView extends StatelessWidget {
  const QuestionView({super.key});

  @override
  Widget build(BuildContext context) {
    final questionUIController = Get.put(QuestionUIController());
    final divide = isPortraitMode(context) ? 8 : 4;
    questionUIController.initAnswerPosition(
      x: screenWidth(context) / 2 - screenHeight(context) / divide,
      y: screenHeight(context) / 2 - screenHeight(context) / divide,
    );

    return Stack(
      children: [
        _backgroundView(context),
        _questionsView(context),
        _floatingAnswerView(context),
      ],
    );
  }

  Widget _backgroundView(BuildContext context) {
    final controller = Get.find<QuestionUIController>();
    return Obx(
      () => SizedBox(
        width: screenWidth(context),
        height: screenHeight(context),
        child: AnimatedContainer(
          color: myQuestion[controller.selectedQuestionIndex.value].color,
          duration: Duration(milliseconds: 500),
        ),
      ),
    );
  }

  Widget _questionsView(BuildContext context) {
    final controller = Get.find<QuestionUIController>();

    return ListWheelScrollView.useDelegate(
      // 아이템 픽셀 높이
      itemExtent: screenHeight(context) / (isPortraitMode(context) ? 10: 8),
      childDelegate: ListWheelChildBuilderDelegate(
        builder: (context, index) {
          return SizedBox(
            width: double.infinity,
            child: Text(
              myQuestion[index % myQuestion.length].question,
              style: GoogleFonts.blackHanSans(
                fontSize: screenHeight(context) / (isPortraitMode(context) ? 13: 10),
                color: Colors.white,
              ),
            ),
          );
        },
      ),
      onSelectedItemChanged: (index) {
        controller.changeSelectedQuestionIndex(index % myQuestion.length);
      },
      physics: const FixedExtentScrollPhysics(),
      // 리스트의 지름
      diameterRatio: 100,
      overAndUnderCenterOpacity: 0.2, // 가운데 아이템의 위, 아래 아이템의 투명도
    );
  }

  _floatingAnswerView(BuildContext context) {
    final controller = Get.find<QuestionUIController>();
    return Obx(
      () => Positioned(
        left: controller.positionX.value,
        top: controller.positionY.value,
        child: MouseRegion(
          cursor: SystemMouseCursors.grab,
          child: GestureDetector(
            onPanUpdate: (details) {
              controller.changePosition(
                x: details.delta.dx,
                y: details.delta.dy,
              );
            },
            child: Container(
              width: screenHeight(context) / (isPortraitMode(context) ? 4 : 2),
              height: screenHeight(context) / (isPortraitMode(context) ? 4 : 2),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xff18183a),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade900.withValues(alpha: 0.3),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: GestureDetector(
                onTap: () {
                  final index = controller.selectedQuestionIndex.value;
                  final childScreen = myQuestion[index].childScreen;
                  if (childScreen != null) {
                    Get.to(() => childScreen);
                  }
                },
                child: Center(
                  child: Text(
                    myQuestion[controller.selectedQuestionIndex.value].answer,
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
