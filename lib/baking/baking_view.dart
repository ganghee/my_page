import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

class _BakingViewState extends State<_BakingView> with SingleTickerProviderStateMixin {
  late final ScrollController _scrollController = ScrollController();
  late AnimationController _animationController;
  late Animation<double> _animation;
  final double radius = 100.0;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _animation = Tween<double>(begin: 0, end: pi / 2).animate(_animationController);

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
          if(controller.focusIndex == 1) {
            _animationController.forward();
          } else {
            _animationController.reverse();
          }
          return Stack(
          children: [
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                final x = radius * cos(_animation.value) * 2;
                final y = radius * sin(_animation.value);
                return Transform.translate(
                  offset: Offset(x, y),
                  child: child,
                );
              },
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        );}
      ),
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
