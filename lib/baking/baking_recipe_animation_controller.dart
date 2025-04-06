import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:my/baking/baking_controller.dart';

class BakingRecipeAnimationController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 500),
  );
  late final Animation<double> animation =
      Tween<double>(begin: 2.2, end: 0.8).animate(_animationController);
  int focusIndex = 0;

  @override
  void onInit() {
    super.onInit();
    _animationController.forward();
    animation.addListener(() {
      update();
    });

    ever(Get.find<BakingController>().focusIndex, (int index) {
      _animationController.reverse().then((_) {
        focusIndex = index;
        _animationController.forward();
      });
    });
  }

  @override
  void onClose() {
    _animationController.dispose();
    super.onClose();
  }
}
