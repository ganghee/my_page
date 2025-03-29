import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:my/travel/model/travel_vo.dart';
import 'package:my/travel/travel_detail_screen.dart';

class TravelMainUIController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final ScrollController scrollController = ScrollController();
  final hoveredIndex = 0.obs;
  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: Duration(milliseconds: 1500),
  );
  late final Animation<double> animation =
      Tween<double>(begin: 4, end: -1).animate(curvedAnimation);
  late final Animation<double> animation2 =
      Tween<double>(begin: 6.5, end: -1.7).animate(curvedAnimation);
  late final CurvedAnimation curvedAnimation = CurvedAnimation(
    parent: _animationController,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void onInit() {
    super.onInit();
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Get.to(
          () => TravelDetailScreen(
            travelId: myTravel[hoveredIndex.value].travelId,
          ),
          duration: Duration(milliseconds: 1200),
          transition: Transition.downToUp,
          fullscreenDialog: true, //
          curve: Curves.fastOutSlowIn,
        );
      }
    });
  }

  onClickItem(int index) {
    hoveredIndex.value = index;
    _animationController.forward();
  }

  onChangeHoveredIndex(int index) {
    if (index == hoveredIndex.value) return;
    hoveredIndex.value = index;
  }

  onChangeScrollOffset({
    required int index,
    required double smallItemWidth,
    required double bigItemWidth,
    required double listWidth,
  }) {
    if (index == hoveredIndex.value) return;
    double offset = index * smallItemWidth - ((listWidth - bigItemWidth) / 2);
    if (index == 0) {
      offset = 0;
    }
    final maxOffset = scrollController.position.maxScrollExtent;
    scrollController.animateTo(
      offset > maxOffset ? maxOffset : offset,
      duration: Duration(milliseconds: 500),
      curve: Curves.linear,
    );
  }

  onDragUpdate(DragUpdateDetails details) {
    scrollController.jumpTo(
      scrollController.offset - details.delta.dx,
    );
  }

  onBeforeRoute() async {
    await Future.delayed(Duration(milliseconds: 800));
    _animationController.reverse();
  }

  @override
  void onClose() {
    scrollController.dispose();
    _animationController.dispose();
    super.onClose();
  }
}
