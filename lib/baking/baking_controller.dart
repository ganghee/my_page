import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:my/baking/baking_vo.dart';

class BakingController extends GetxController {
  int focusIndex = 0;
  BakingVo nextBakingVo = bakings[1];
  BakingVo currentBakingVo = bakings[0];
  BakingVo beforeBakingVo = bakings[2];
  double animationValue = 0;

  changeFocusIndex(int index) {
    if (focusIndex == index) return;
    focusIndex = index;
    update();
  }

  changeAnimationValue({
    required double currentAnimationValue,
    required bool isForward,
  }) {
    if(currentAnimationValue == 0.8 || currentAnimationValue == 0) {
      animationValue = currentAnimationValue;
      return;
    }
    if (isForward) {
      if (currentAnimationValue > 0 && animationValue == 0) {
        animationValue = currentAnimationValue;
        update();
      } else if (currentAnimationValue > 0.2 && animationValue <= 0.2) {
        animationValue = currentAnimationValue;
        update();
      } else if (currentAnimationValue > 0.4 && animationValue <= 0.4) {
        animationValue = currentAnimationValue;
        currentBakingVo = bakings[3];
        update();
      } else if (currentAnimationValue > 0.6 && animationValue <= 0.6) {
        animationValue = currentAnimationValue;
        nextBakingVo = bakings[4];
        update();
      } else if (currentAnimationValue == 0.8) {
        animationValue = currentAnimationValue;
      }
    } else {
      if (currentAnimationValue < 0.2 && animationValue >= 0.2) {
        animationValue = currentAnimationValue;
        currentBakingVo = bakings[0];
        update();
      } else if (currentAnimationValue < 0.4 && animationValue >= 0.4) {
        animationValue = currentAnimationValue;
        nextBakingVo = bakings[1];
        update();
      } else if (currentAnimationValue < 0.6 && animationValue >= 0.6) {
        animationValue = currentAnimationValue;
      } else if (currentAnimationValue < 0.8 && animationValue == 0.8) {
        animationValue = currentAnimationValue;
      }
    }
  }
}
