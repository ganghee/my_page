part of 'baking_screen.dart';

class _BakingNameView extends StatelessWidget {
  const _BakingNameView();

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: BakingNameAnimationController(),
      builder: (controller) {
        final double alignmentX = isPortraitMode(context) ? 0 : -0.2;
        final double addAlignmentY = isPortraitMode(context) ? -0.3 : 0;
        return Align(
          alignment: Alignment(
            alignmentX,
            controller.alignmentAnimation.value + addAlignmentY,
          ),
          child: Opacity(
            opacity: controller.opacityAnimation.value,
            child: Text(
              controller.bakingName,
              style: GoogleFonts.bagelFatOne().copyWith(
                fontSize: 40,
                color: Colors.brown,
              ),
            ),
          ),
        );
      },
    );
  }
}
