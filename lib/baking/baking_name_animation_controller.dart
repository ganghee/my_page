import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:my/baking/baking_controller.dart';
import 'package:my/baking/baking_vo.dart';

class BakingNameAnimationController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 500),
  );
  late final Animation<double> opacityAnimation =
      Tween<double>(begin: 0, end: 1).animate(_animationController);
  late final Animation<double> alignmentAnimation =
      Tween<double>(begin: -0.55, end: -0.5).animate(_animationController);
  String bakingName = bakings[0].name;
  late final Worker _focusIndexWorker;

  @override
  void onInit() {
    super.onInit();
    _animationController.forward();
    opacityAnimation.addListener(() {
      update();
    });

    _animationController.forward();
    _focusIndexWorker =
        ever(Get.find<BakingController>().focusIndex, (int index) async {
      _animationController.reverse().then((_)  {
        bakingName = bakings[index].name;
        _animationController.forward();
      });
    });
  }

  @override
  void onClose() {
    _focusIndexWorker.dispose();
    _animationController.dispose();
    super.onClose();
  }
}
