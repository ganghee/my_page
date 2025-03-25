import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:my/baking/baking_controller.dart';
import 'package:my/baking/baking_vo.dart';

class BakingRotationAnimationController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: Duration(seconds: 1),
  );
  late final Animation<double> animation =
      Tween<double>(begin: 0, end: pi * 2 * bakings.length / 3)
          .animate(_animationController);

  @override
  void onInit() {
    super.onInit();

    _animationController.addListener(
      () {
        Get.find<BakingController>().changeAnimationValue(
          currentAnimationValue: _animationController.value,
          isForward: _animationController.velocity >= 0,
        );
      },
    );
    Get.find<BakingController>().focusIndex.stream.listen(
      (index) {
        _animationController.animateTo(
          index / bakings.length,
          duration: Duration(seconds: 1),
        );
      },
    );
  }

  @override
  void onClose() {
    _animationController.dispose();
    super.onClose();
  }
}
