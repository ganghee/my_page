part of 'baking_view.dart';

class _BakingRotationView extends StatelessWidget {
  const _BakingRotationView();

  @override
  Widget build(BuildContext context) {
    double radius = screenHeight(context) / 2;
    final double imageSize = screenWidth(context) / 4;
    final initRotation = pi / 2;
    final screenRatio = screenHeight(context) *
        1.2 /
        screenWidth(context);
    Get.put(BakingRotationAnimationController());

    final animation = Get.find<BakingRotationAnimationController>().animation;
    final bakingController = Get.find<BakingController>();

    Alignment alignment = Alignment(-1, -2.5);

    // 세로 모드일 때
    if (screenWidth(context) <
        screenHeight(context)) {
      alignment = Alignment(-1.4, -1.2);
      radius = 100;
    }
    return Align(
      alignment: alignment,
      child: Stack(
        children: [
          AnimatedBuilder(
            animation: animation,
            builder: (context, child) {
              final rotation = animation.value + initRotation;
              final x = radius * cos(rotation);
              final y = radius * sin(rotation) * screenRatio;
              return Transform.translate(
                offset: Offset(x + 100, y + 100),
                child: child,
              );
            },
            child: Obx(
              () => Image.network(
                bakingController.currentBakingVo.value.imageUrl,
                width: imageSize,
                height: imageSize,
              ),
            ),
          ),
          AnimatedBuilder(
            animation: animation,
            builder: (context, child) {
              final rotation = animation.value + initRotation;
              final x = radius * cos(rotation - (pi * 2 / 3));
              final y = radius * sin(rotation - (pi * 2 / 3)) * screenRatio;
              return Transform.translate(
                offset: Offset(x + 100, y + 100),
                child: child,
              );
            },
            child: Obx(
              () => Image.network(
                bakingController.nextBakingVo.value.imageUrl,
                width: imageSize,
                height: imageSize,
              ),
            ),
          ),
          AnimatedBuilder(
            animation: animation,
            builder: (context, child) {
              final rotation = animation.value + initRotation;
              final x = radius * cos(rotation - (pi * 4 / 3));
              final y = radius * sin(rotation - (pi * 4 / 3)) * screenRatio;
              return Transform.translate(
                offset: Offset(x + 100, y + 100),
                child: child,
              );
            },
            child: Obx(
              () => Image.network(
                bakingController.beforeBakingVo.value.imageUrl,
                width: imageSize,
                height: imageSize,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
