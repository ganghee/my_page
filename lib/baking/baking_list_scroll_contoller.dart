import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:my/baking/baking_controller.dart';

import 'baking_vo.dart';

class BakingListScrollController extends GetxController {
  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    Get.find<BakingController>().focusIndex.stream.listen(
      (index) {
        final double maxScrollExtent =
            scrollController.position.maxScrollExtent;
        final itemWidth =
            scrollController.position.maxScrollExtent / (bakings.length - 1);
        double scrollExtent = index * itemWidth;

        /// 스크롤 범위를 벗어나지 않도록 처리
        if (maxScrollExtent < scrollExtent) {
          scrollExtent = maxScrollExtent;
        }
        scrollController.animateTo(
          scrollExtent,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      },
    );
  }

  onDragUpdate(DragUpdateDetails details) {
    scrollController.jumpTo(
      scrollController.offset - details.delta.dx,
    );
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
