part of 'baking_screen.dart';

class _BakingRecipeView extends StatelessWidget {
  const _BakingRecipeView();

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: BakingRecipeAnimationController(),
      builder: (controller) {
        final alignment = isPortraitMode(context)
            ? Alignment(0, 1)
            : Alignment(controller.animation.value, -0.3);
        return Align(
          alignment: alignment,
          child: Builder(
            builder: (context) {
              final ingredients =
                  bakings[controller.focusIndex].ingredients.tr.split(', ');
              return Container(
                width: screenWidth(context) / (isPortraitMode(context) ? 1 : 3),
                height:
                    screenHeight(context) / (isPortraitMode(context) ? 2 : 1.5),
                padding: EdgeInsets.all(40),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '재료'.tr,
                            style: TextStyle(fontSize: 20),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          SizedBox(height: 20),
                          Flexible(
                            flex: 1,
                            child: ListView.separated(
                              shrinkWrap: true,
                              itemBuilder: (_, int index) {
                                return ingredients.isEmpty
                                    ? SizedBox()
                                    : Container(
                                        padding: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border:
                                              Border.all(color: Colors.brown),
                                          color: Colors.white,
                                        ),
                                        child: Text(ingredients[index]),
                                      );
                              },
                              separatorBuilder: (_, __) => SizedBox(height: 8),
                              itemCount: ingredients.length,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 20),
                    _recipeView(focusIndex: controller.focusIndex),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _recipeView({required int focusIndex}) {
    return Expanded(
      flex: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('레시피'.tr, style: TextStyle(fontSize: 20)),
          SizedBox(height: 20),
          Flexible(
            flex: 1,
            child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (_, int index) {
                final translationKey = '${bakings[focusIndex].name}recipe$index';
                return bakings[focusIndex].recipe.isEmpty
                    ? SizedBox()
                    : Text(
                        '${index + 1}. ${translationKey.tr}',
                      );
              },
              separatorBuilder: (_, __) {
                return SizedBox(height: 8);
              },
              itemCount: bakings[focusIndex].recipe.length,
            ),
          )
        ],
      ),
    );
  }
}
