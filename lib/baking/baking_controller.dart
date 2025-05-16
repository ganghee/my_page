import 'package:get/get.dart';
import 'package:my/baking/baking_vo.dart';

class BakingController extends GetxController {
  final RxInt focusIndex = 0.obs;
  final nextBakingVo = bakings[1].obs;
  final currentBakingVo = bakings[0].obs;
  final beforeBakingVo = bakings[2].obs;
  double _animationValue = 0;
  final double _part = 1 / bakings.length;

  void changeFocusIndex(int index) {
    if (focusIndex.value == index) return;
    focusIndex.value = index;
    update();
  }

  void changeAnimationValue({
    required double currentAnimationValue,
    required bool isForward,
  }) {
    if (_isAtBoundary(currentAnimationValue)) {
      _animationValue = currentAnimationValue;
      return;
    }

    if (isForward) {
      _handleClockwiseRotation(currentAnimationValue);
    } else {
      _handleCounterClockwiseRotation(currentAnimationValue);
    }
  }

  bool _isAtBoundary(double currentAnimationValue) {
    return currentAnimationValue == _part * (bakings.length - 1) ||
        currentAnimationValue == 0;
  }

  void _handleClockwiseRotation(double currentAnimationValue) {
    for (int i = 0; i < bakings.length - 1; i++) {
      if (_shouldUpdateBakingVo(i, currentAnimationValue)) {
        _updateBakingVoForClockwise(i);
        break;
      }
    }
  }

  void _handleCounterClockwiseRotation(double currentAnimationValue) {
    for (int i = 1; i < bakings.length; i++) {
      if (_shouldUpdateBakingVoCounterClockwise(i, currentAnimationValue)) {
        _updateBakingVoForCounterClockwise(i);
        break;
      }
    }
  }

  bool _shouldUpdateBakingVo(int i, double currentAnimationValue) {
    return currentAnimationValue > _part * i && _animationValue <= _part * i;
  }

  bool _shouldUpdateBakingVoCounterClockwise(
      int i, double currentAnimationValue) {
    return currentAnimationValue < _part * i && _animationValue >= _part * i;
  }

  void _updateBakingVoForClockwise(int i) {
    _animationValue = _part * i;
    if (i % 3 == 2) {
      currentBakingVo.value = bakings[i + 1];
    } else if (i % 3 == 0 && i != 0) {
      nextBakingVo.value = bakings[i + 1];
    } else {
      beforeBakingVo.value = bakings[i + 1];
    }
    update();
  }

  void _updateBakingVoForCounterClockwise(int i) {
    _animationValue = _part * i;
    if (i % 3 == 2) {
      nextBakingVo.value = bakings[i - 1];
    } else if (i % 3 == 1) {
      currentBakingVo.value = bakings[i - 1];
    } else {
      beforeBakingVo.value = bakings[i - 1];
    }
    update();
  }
}
