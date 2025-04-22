part of 'baking_screen.dart';

class _BakingNameView extends StatelessWidget {
  const _BakingNameView();

  @override
  Widget build(BuildContext context) {
    final double alignmentX = isPortraitMode(context) ? 0 : -0.2;
    final double addAlignmentY = isPortraitMode(context) ? -0.3 : 0;

    return GetBuilder(
      init: BakingNameAnimationController(),
      builder: (controller) {
        return Align(
          alignment: Alignment(
            alignmentX,
            controller.alignmentAnimation.value + addAlignmentY,
          ),
          child: AnimatedBuilder(
            animation: controller.opacityAnimation,
            builder: (BuildContext context, Widget? child) {
              return Opacity(
                opacity: controller.opacityAnimation.value,
                child: Text(
                  controller.bakingName.tr,
                  style: GoogleFonts.bagelFatOne().copyWith(
                    fontSize: 40,
                    color: Colors.brown,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
