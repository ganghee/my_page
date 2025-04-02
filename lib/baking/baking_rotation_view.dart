part of 'baking_screen.dart';

class _BakingRotationView extends StatelessWidget {
  const _BakingRotationView();

  @override
  Widget build(BuildContext context) {
    double radius = screenHeight(context) / (isPortraitMode(context) ? 3.5 : 2);
    final double imageSize =
        screenWidth(context) / (isPortraitMode(context) ? 3 : 4);
    final initRotation = pi / 2;
    final rotationSizeX = isPortraitMode(context) ? 2 : 1;
    final rotationSizeY = screenHeight(context) * 1.2 / screenWidth(context);
    Get.put(BakingRotationAnimationController());

    final animation = Get.find<BakingRotationAnimationController>().animation;
    final bakingController = Get.find<BakingController>();

    return Align(
      alignment:
          isPortraitMode(context) ? Alignment(-0.6, -2.3) : Alignment(-1, -2.5),
      child: Stack(
        children: [
          AnimatedBuilder(
            animation: animation,
            builder: (context, child) {
              final rotation = animation.value + initRotation;
              final x = radius * cos(rotation) * rotationSizeX;
              final y = radius * sin(rotation) * rotationSizeY;
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
              final x = radius * cos(rotation - (pi * 2 / 3)) * rotationSizeX;
              final y = radius * sin(rotation - (pi * 2 / 3)) * rotationSizeY;
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
              final x = radius * cos(rotation - (pi * 4 / 3)) * rotationSizeX;
              final y = radius * sin(rotation - (pi * 4 / 3)) * rotationSizeY;
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
