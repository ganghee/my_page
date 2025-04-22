part of 'baking_screen.dart';

class _BakingListView extends StatelessWidget {
  final bakingController = Get.find<BakingController>();

  @override
  Widget build(BuildContext context) {
    Get.put(BakingListScrollController());

    return Align(
      alignment: Alignment(-0.8, isPortraitMode(context) ? -0.2 : 0.3),
      child: Container(
        width: screenWidth(context) / (isPortraitMode(context) ? 1 : 2),
        height: screenHeight(context) / 4,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _arrowButton(
              icon: Icons.arrow_back_ios_rounded,
              onTap: () {
                final focusIndex = bakingController.focusIndex.value;
                if (focusIndex == 0) return;
                bakingController.changeFocusIndex(focusIndex - 1);
              },
            ),
            _breadItemsView(context: context),
            _arrowButton(
              icon: Icons.arrow_forward_ios_rounded,
              onTap: () {
                final focusIndex = bakingController.focusIndex.value;
                if (focusIndex == bakings.length - 1) return;
                bakingController.changeFocusIndex(focusIndex + 1);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _breadItemsView({required BuildContext context}) {
    final breadItemWidth =
        screenWidth(context) / (isPortraitMode(context) ? 10 : 14);
    final bakingListScrollController = Get.find<BakingListScrollController>();
    return SizedBox(
      width: screenWidth(context) / (isPortraitMode(context) ? 1 : 2) - 80,
      height: screenHeight(context) / 7,
      child: GestureDetector(
        onPanUpdate: bakingListScrollController.onDragUpdate,
        child: ListView.separated(
          controller: bakingListScrollController.scrollController,
          scrollDirection: Axis.horizontal,
          itemCount: bakings.length,
          separatorBuilder: (BuildContext context, int index) =>
              SizedBox(width: isPortraitMode(context) ? 20 : 40),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                bakingController.changeFocusIndex(index);
              },
              child: GetBuilder(
                init: BakingController(),
                builder: (bakingController) {
                  return Container(
                    padding: EdgeInsets.only(
                      bottom: 10,
                      top: 10,
                      left: isPortraitMode(context) ? 10 : 0,
                      right: isPortraitMode(context) ? 10 : 0,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: bakingController.focusIndex.value == index
                          ? Colors.white
                          : Colors.transparent,
                      border: bakingController.focusIndex.value == index
                          ? Border.all(
                              color: Colors.brown,
                              width: 2,
                            )
                          : null,
                    ),
                    width: breadItemWidth * 1.6,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          flex: 1,
                          child: ImageView(
                            imageUrl: bakings[index].imageUrl,
                            fit: BoxFit.contain,
                            width: breadItemWidth,
                            height: breadItemWidth,
                          ),
                        ),
                        // SizedBox(height: index == 1 || index == 2 ? 20 : 0),
                        Text(
                          bakings[index].name.tr,
                          style: TextStyle(color: Colors.black),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _arrowButton({
    required IconData icon,
    required Function() onTap,
  }) {
    return Flexible(
      flex: 1,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(2),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.brown),
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            size: 20,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
}
