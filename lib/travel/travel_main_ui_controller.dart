import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:my/travel/model/travel_vo.dart';
import 'package:my/travel/travel_binding.dart';
import 'package:my/travel/travel_detail_screen.dart';

class TravelMainUIController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final ScrollController scrollController = ScrollController();
  final hoveredIndex = 0.obs;
  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 2500),
  );
  late final Animation<double> animation =
      Tween<double>(begin: 3.5, end: -2).animate(_curvedAnimation);
  late Animation<double> animation2 =
      Tween<double>(begin: 0, end: -10).animate(_curvedAnimation);
  late final CurvedAnimation _curvedAnimation = CurvedAnimation(
    parent: _animationController,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void onInit() {
    super.onInit();
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Get.to(
          () => const TravelDetailScreen(),
          routeName: '/travel/${myTravel[hoveredIndex.value].travelId}',
          arguments: myTravel[hoveredIndex.value].travelId,
          duration: const Duration(milliseconds: 1200),
          transition: Transition.downToUp,
          fullscreenDialog: true,
          curve: Curves.fastOutSlowIn,
          binding: TravelDetailBinding(),
        );
      }
    });
  }

  void setAnimation2(double height) {
    animation2 = Tween<double>(begin: height * 1.2, end: -height * 0.5)
        .animate(_curvedAnimation);
  }

  void onClickItem(int index) {
    hoveredIndex.value = index;
    _animationController.forward();
  }

  void onChangeHoveredIndex(int index) {
    if (index == hoveredIndex.value) return;
    hoveredIndex.value = index;
  }

  void onChangeScrollOffset({
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
      duration: const Duration(milliseconds: 500),
      curve: Curves.linear,
    );
  }

  void onDragUpdate(DragUpdateDetails details) {
    scrollController.jumpTo(
      scrollController.offset - details.delta.dx,
    );
  }

  Future<void> onBeforeRoute() async {
    await Future.delayed(const Duration(milliseconds: 800));
    _animationController.reverse();
  }

  @override
  void onClose() {
    scrollController.dispose();
    _animationController.dispose();
    super.onClose();
  }

  void stopAnimation() {
    if (_animationController.isAnimating) {
      _animationController.reverse();
    } else {
      Get.back();
    }
  }
}
