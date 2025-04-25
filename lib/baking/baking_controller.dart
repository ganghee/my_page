import 'package:get/get.dart';
import 'package:my/baking/baking_vo.dart';

class BakingController extends GetxController {
  final RxInt focusIndex = 0.obs;
  final nextBakingVo = bakings[1].obs;
  final currentBakingVo = bakings[0].obs;
  final beforeBakingVo = bakings[2].obs;
  double _animationValue = 0;
  final _part = 1 / bakings.length;

  changeFocusIndex(int index) {
    if (focusIndex.value == index) return;
    focusIndex.value = index;
    update();
  }

  changeAnimationValue({
    required double currentAnimationValue,
    required bool isForward,
  }) {
    if (currentAnimationValue == _part * (bakings.length - 1) ||
        currentAnimationValue == 0) {
      _animationValue = currentAnimationValue;
      return;
    }
    // when clockwise rotation
    if (isForward) {
      for (int i = 0; i < bakings.length - 1; i++) {
        if (currentAnimationValue > _part * i && _animationValue <= _part * i) {
          _animationValue = currentAnimationValue;
          if (i % 3 == 2) {
            currentBakingVo.value = bakings[i + 1];
          } else if (i % 3 == 0 && i != 0) {
            nextBakingVo.value = bakings[i + 1];
          } else {
            beforeBakingVo.value = bakings[i + 1];
          }
          update();
          break;
        }
      }
    } else { // when counter clockwise rotation
      for (int i = 1; i < bakings.length; i++) {
        if (currentAnimationValue < _part * i && _animationValue >= _part * i) {
          _animationValue = currentAnimationValue;
          if (i % 3 == 2) {
            nextBakingVo.value = bakings[i - 1];
          } else if (i % 3 == 1) {
            currentBakingVo.value = bakings[i - 1];
          } else {
            beforeBakingVo.value = bakings[i - 1];
          }
          update();
          break;
        }
      }
    }
  }
}
