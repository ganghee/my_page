import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my/question/question_ui_controller.dart';
import 'package:my/question/question_vo.dart';
import 'package:my/travel/model/travel_vo.dart';
import 'package:my/travel/travel_main_ui_controller.dart';
import 'package:my/util/image_view.dart';
import 'package:my/util/size.dart';
import 'package:my/util/translation_floating_button.dart';

class QuestionScreen extends StatelessWidget {
  const QuestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(QuestionUIController());
    final dividerSize = isPortraitMode(context) ? 8 : 4;
    if (controller.offset.value == Offset.zero) {
      controller.initAnswerPosition(
        newOffset: Offset(
          screenWidth(context) / 2 - screenHeight(context) / dividerSize,
          screenHeight(context) / 2 - screenHeight(context) / dividerSize,
        ),
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          _backgroundView(context),
          _questionsView(context),
          _floatingAnswerView(),
        ],
      ),
      floatingActionButton: TranslationFloatingButton(),
    );
  }

  Widget _backgroundView(BuildContext context) {
    final controller = Get.put(QuestionUIController());

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
    final controller = Get.put(QuestionUIController());

    return ListWheelScrollView.useDelegate(
      // 아이템 픽셀 높이
      itemExtent: screenHeight(context) / (isPortraitMode(context) ? 10 : 8),
      childDelegate: ListWheelChildBuilderDelegate(
        builder: (context, index) {
          final focusedIndex = index % myQuestion.length;
          return SizedBox(
            width: double.infinity,
            child: GestureDetector(
              onTap: () {
                final childPath = myQuestion[focusedIndex].path;
                if (childPath != null) {
                  Get.to(
                    myQuestion[focusedIndex].answerScreen,
                    routeName: childPath,
                    transition: Transition.fadeIn,
                    duration: Duration(milliseconds: 500),
                  );
                }
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Flexible(
                    child: Text(
                      myQuestion[focusedIndex].question.tr,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.blackHanSans(
                        fontSize: screenHeight(context) /
                            (isPortraitMode(context) ? 13 : 10),
                        height: 0.9,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Visibility(
                    visible: myQuestion[focusedIndex].answerScreen != null,
                    child: Text(
                      '[열기]'.tr,
                      style: GoogleFonts.blackHanSans(
                        fontSize: screenHeight(context) /
                            (isPortraitMode(context) ? 39 : 30),
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
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

  _floatingAnswerView() {
    final controller = Get.put(QuestionUIController());

    return Obx(
      () => Positioned(
        left: controller.offset.value.dx,
        top: controller.offset.value.dy,
        child: MouseRegion(
          cursor: SystemMouseCursors.grab,
          child: GestureDetector(
            onPanUpdate: (details) {
              controller.changePosition(newOffset: details.delta);
            },
            child: _answerHeroView(),
          ),
        ),
      ),
    );
  }

  _answerHeroView() {
    final controller = Get.put(QuestionUIController());
    final questionFocusedIndex = controller.selectedQuestionIndex.value;
    final travelUIController = Get.put(TravelMainUIController());
    final travelFocusedIndex = travelUIController.hoveredIndex.value;

    return Builder(
      builder: (context) {
        return Hero(
          tag: 'answer',
          flightShuttleBuilder: (_, __, ___, ____, _____) {
            return _travelBackgroundView(
                  questionFocusedIndex: questionFocusedIndex,
                  travelFocusedIndex: travelFocusedIndex,
                ) ??
                Container(
                  width: screenWidth(context),
                  height: screenHeight(context),
                  color: Colors.black,
                  child: myQuestion[questionFocusedIndex].transitionScreen,
                );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: screenHeight(context) / (isPortraitMode(context) ? 4 : 2),
              height: screenHeight(context) / (isPortraitMode(context) ? 4 : 2),
              decoration: BoxDecoration(
                color: Color(0xff18183a),
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
                  final childPath = myQuestion[questionFocusedIndex].path;
                  if (childPath != null) {
                    Get.to(
                      myQuestion[questionFocusedIndex].answerScreen,
                      routeName: childPath,
                      transition: Transition.fadeIn,
                      duration: Duration(milliseconds: 500),
                    );
                  }
                },
                child: Stack(
                  alignment: Alignment.center,
                  fit: StackFit.expand,
                  children: [
                    _travelBackgroundView(
                          questionFocusedIndex: questionFocusedIndex,
                          travelFocusedIndex: travelFocusedIndex,
                        ) ??
                        myQuestion[questionFocusedIndex].transitionScreen ??
                        SizedBox(),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          myQuestion[questionFocusedIndex].answer.tr,
                          style: TextStyle(
                            color:
                                myQuestion[questionFocusedIndex].path == '/baking'
                                    ? Colors.black
                                    : Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  _travelBackgroundView({
    required int questionFocusedIndex,
    required int travelFocusedIndex,
  }) {
    if (myQuestion[questionFocusedIndex].path == '/travel') {
      return ImageView(
        imageUrl: myTravel[travelFocusedIndex].imageUrl,
        color: Colors.black.withAlpha(180),
        colorBlendMode: BlendMode.darken,
      );
    }
  }
}
