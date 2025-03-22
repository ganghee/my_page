import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class BookItemAnimationController extends GetxController
    with GetSingleTickerProviderStateMixin {
  bool isHover = false;
  late final AnimationController _animationController = AnimationController(
    duration: Duration(seconds: Random().nextInt(3) + 1),
    vsync: this,
  );
  late final Animation<Offset> animation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(0, 0.08),
  ).animate(_animationController);

  @override
  void onClose() {
    _animationController.dispose();
    super.onClose();
  }
}
