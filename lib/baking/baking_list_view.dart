part of 'baking_view.dart';

Widget bakingListView({required ScrollController scrollController}) {
  void onDragUpdate(DragUpdateDetails details) {
    scrollController.jumpTo(
      scrollController.offset - details.delta.dx,
    );
  }

  return Align(
    alignment: Alignment(-0.8, 0.3),
    child: Builder(builder: (context) {
      return Container(
        width: MediaQuery.of(context).size.width / 2,
        height: MediaQuery.of(context).size.height / 4,
        alignment: Alignment.center,
        color: Colors.orange,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.arrow_back_ios,
              size: 20,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2 - 80,
              child: GestureDetector(
                onPanUpdate: onDragUpdate,
                child: ListView(
                  controller: scrollController,
                  scrollDirection: Axis.horizontal,
                  children: List.generate(5, (index) {
                    return GestureDetector(
                      onTap: () {
                        Get.find<BakingController>().changeFocusIndex(index);
                      },
                      child: GetBuilder(
                        init: BakingController(),
                        builder: (value) => SizedBox(
                          width: 200,
                          child: Container(
                            color: value.focusIndex == index
                                ? Colors.red
                                : Colors.blue,
                            child: Text('Item $index'),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 20,
            ),
          ],
        ),
      );
    }),
  );
}
