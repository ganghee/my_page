import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my/baking/baking_vo.dart';

import 'baking_controller.dart';

part 'baking_list_view.dart';

Widget bakingView() {
  return Builder(builder: (context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: _BakingView(),
    );
  });
}

class _BakingView extends StatefulWidget {
  const _BakingView();

  @override
  State<_BakingView> createState() => _BakingViewState();
}

class _BakingViewState extends State<_BakingView>
    with SingleTickerProviderStateMixin {
  late final ScrollController _scrollController = ScrollController();
  late AnimationController _animationController;
  late Animation<double> _animation;
  final double radius = 10.0;
  final animationDuration = Duration(seconds: 1);

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: animationDuration,
    );
    _animation = Tween<double>(begin: 0, end: pi * 2 * bakings.length / 3)
        .animate(_animationController);
    _animationController.addListener(
      () {
        Get.find<BakingController>().changeAnimationValue(
          currentAnimationValue: _animationController.value,
          isForward: _animationController.velocity >= 0,
        );
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        bakingMainView(),
        bakingDetailView(),
        bakingListView(scrollController: _scrollController),
      ],
    );
  }

  Widget bakingMainView() {
    return Align(
      alignment: Alignment.topLeft,
      child: GetBuilder(
          init: BakingController(),
          builder: (controller) {
            _animationController.animateTo(
              controller.focusIndex / bakings.length,
              duration: Duration(seconds: 1),
            );

            return Stack(
              children: [
                AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    final x = radius * cos(_animation.value) * 2;
                    final y = radius * sin(_animation.value) * 2;
                    return Transform.translate(
                      offset: Offset(x + 100, y + 100),
                      child: child,
                    );
                  },
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: controller.currentBakingVo.color,
                      shape: BoxShape.rectangle,
                    ),
                  ),
                ),
                AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    final x = radius * cos(_animation.value - (pi * 2 / 3)) * 2;
                    final y = radius * sin(_animation.value - (pi * 2 / 3)) * 2;
                    return Transform.translate(
                      offset: Offset(x + 100, y + 100),
                      child: child,
                    );
                  },
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: controller.nextBakingVo.color,
                      shape: BoxShape.rectangle,
                    ),
                  ),
                ),
                AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    final x = radius * cos(_animation.value - (pi * 4 / 3)) * 2;
                    final y = radius * sin(_animation.value - (pi * 4 / 3)) * 2;
                    return Transform.translate(
                      offset: Offset(x + 100, y + 100),
                      child: child,
                    );
                  },
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: controller.beforeBakingVo.color,
                      shape: BoxShape.rectangle,
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }

  Widget bakingDetailView() {
    return Align(
      alignment: Alignment(0.8, -0.3),
      child: Container(
        width: MediaQuery.of(context).size.width / 3,
        height: MediaQuery.of(context).size.height / 2,
        color: Colors.red,
      ),
    );
  }
}
