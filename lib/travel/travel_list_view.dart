part of 'travel_screen.dart';

class _TravelListView extends StatelessWidget {
  const _TravelListView();

  @override
  Widget build(BuildContext context) {
    final listWidth = screenWidth(context) / 1.5;

    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        width: listWidth,
        height: screenHeight(context) / 2.5,
        child: GetBuilder(
          init: TravelMainUIController(),
          builder: (controller) => GestureDetector(
            onPanUpdate: controller.onDragUpdate,
            child: ListView(
              controller: controller.scrollController,
              scrollDirection: Axis.horizontal,
              children: List.generate(
                myTravel.length,
                (index) => _travelItemView(
                  context: context,
                  index: index,
                  listWidth: listWidth,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _travelItemView({
    required BuildContext context,
    required int index,
    required double listWidth,
  }) {
    final bigWidth = screenWidth(context) / 2;
    final smallWidth = screenWidth(context) / 8;
    final controller = Get.find<TravelMainUIController>();

    return Padding(
      padding: const EdgeInsets.all(2),
      child: GestureDetector(
        onTap: () {
          controller.onClickItem(index);
        },
        child: MouseRegion(
          onHover: (event) {
            controller.onChangeScrollOffset(
              index: index,
              smallItemWidth: smallWidth + 4,
              bigItemWidth: bigWidth,
              listWidth: listWidth,
            );
            controller.onChangeHoveredIndex(index);
          },
          child: Obx(
            () => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              width: index == controller.hoveredIndex.value
                  ? bigWidth
                  : smallWidth,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    myTravel[index % myTravel.length].imageUrl,
                    fit: BoxFit.cover,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        myTravel[index % myTravel.length].title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenHeight(context) / 20,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              color: Colors.black,
                              offset: Offset(1, 1),
                              blurRadius: 5,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
