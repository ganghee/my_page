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
  late final Worker _focusIndexWorker;
  bool _isPortrait = false;

  @override
  void onInit() {
    super.onInit();
    _animationController.forward();
    animation.addListener(() {
      update();
    });

    _focusIndexWorker =
        ever(Get.find<BakingController>().focusIndex, (int index) async {
      if (_isPortrait) {
        focusIndex = index;
        update();
      } else {
        _animationController.reverse().then((_) async {
          focusIndex = index;
          _animationController.forward();
        });
      }
    });
  }

  setPortraitMode(bool isPortrait) {
    _isPortrait = isPortrait;
  }

  @override
  void onClose() {
    _focusIndexWorker.dispose();
    _animationController.dispose();
    super.onClose();
  }
}
