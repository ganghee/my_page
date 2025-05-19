import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my/travel/model/travel_vo.dart';
import 'package:my/travel/travel_main_ui_controller.dart';
import 'package:my/travel/travel_route_painter.dart';
import 'package:my/util/image_view.dart';
import 'package:my/util/size.dart';

part 'travel_list_view.dart';

class TravelScreen extends StatelessWidget {
  const TravelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, didPopResult) async {
        final travelScrollController = Get.find<TravelMainUIController>();
        travelScrollController.stopAnimation();
      },
      child: Scaffold(
        body: Container(
          color: Colors.black,
          width: screenWidth(context),
          height: screenHeight(context),
          child: Hero(
            tag: 'answer',
            child: Stack(
              children: [
                _backgroundView(context),
                _TravelListView(),
                _PageAnimationView(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _backgroundView(BuildContext context) {
    final travelScrollController = Get.find<TravelMainUIController>();

    return Obx(
      () => AnimatedSwitcher(
        duration: const Duration(milliseconds: 800),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(opacity: animation, child: child);
        },
        child: ImageView(
          key: ValueKey(travelScrollController.hoveredIndex.value),
          imageUrl:
              myTravel[travelScrollController.hoveredIndex.value].imageUrl,
          color: Colors.black.withAlpha(180),
          colorBlendMode: BlendMode.darken,
          width: screenWidth(context),
          height: screenHeight(context),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PageAnimationView extends StatelessWidget {
  const _PageAnimationView();

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (TravelMainUIController controller) {
        controller.setAnimation2(screenHeight(context));
        return Stack(
          children: [
            AnimatedBuilder(
              animation: controller.animation,
              builder: (context, child) => Align(
                alignment: Alignment(0, controller.animation.value),
                // 0은 중앙, -1은 상단, 1은 하단, 3은 스크린 하단
                child: CustomPaint(
                  size: Size(screenWidth(context), screenHeight(context) * 0.5),
                  painter: TravelRoutePainter(
                    color: Colors.red,
                    routerType: RouterType.first,
                  ),
                ),
              ),
            ),
            AnimatedBuilder(
              animation: controller.animation2,
              builder: (context, child) => Positioned(
                top: controller.animation2.value,
                child: ClipPath(
                  clipper: WaveClipper(),
                  child: Image.asset(
                    myTravel[controller.hoveredIndex.value].patternImage,
                    fit: BoxFit.contain,
                    repeat: ImageRepeat.repeat,
                    width: screenWidth(context),
                    height: screenHeight(context) * 1.5,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..moveTo(0, size.height)
      ..lineTo(0, size.height / 6)
      ..quadraticBezierTo(
        size.width * 0.8,
        -size.height / 20,
        size.width,
        size.height / 6,
      )
      ..lineTo(size.width, size.height)
      ..close();
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
