import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my/baking/baking_controller.dart';
import 'package:my/baking/baking_vo.dart';

class BakingBackgroundColorController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 500),
  );
  late Animation<Color?> colorAnimation = ColorTween(
    begin: bakings[0].color,
    end: bakings[1].color,
  ).animate(_animationController);
  late final Worker _focusIndexWorker;

  @override
  void onInit() {
    super.onInit();
    _animationController.forward();

    _focusIndexWorker =
        ever(Get.find<BakingController>().focusIndex, (int index) async {
      colorAnimation = ColorTween(
        begin: colorAnimation.value,
        end: bakings[index].color,
      ).animate(_animationController);
      _animationController.forward();
    });
  }

  @override
  void onClose() {
    _focusIndexWorker.dispose();
    _animationController.dispose();
    super.onClose();
  }
}
