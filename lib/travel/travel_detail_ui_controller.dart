import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:my/travel/model/travel_detail_vo.dart';

class TravelDetailUIController extends GetxController {
  final listKey = GlobalKey<AnimatedListState>();
  final List<TravelItemVo> items = [];
  final ScrollController scrollController = ScrollController();
  final RxSet<int> visibleItems = <int>{}.obs;
  final Map<int, GlobalKey> itemKeys = {};
  double _screenHeight = 0;

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(_onScroll);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final maxInitItems = min(3, items.length);
      await _addItemKeys();
      for (int i = 0; i < maxInitItems; i++) {
        // 리스트의 처음 10개 아이템은 스크롤 감지를 위해 visibleItems에 추가
        await Future.delayed(const Duration(milliseconds: 500));
        visibleItems.add(i);
        listKey.currentState?.insertItem(i);
      }
    });
  }

  @override
  void onClose() {
    scrollController.removeListener(_onScroll);
    scrollController.dispose();
    super.onClose();
  }

  setTravelItems(int travelId) async {
    final List<TravelItemVo> travelItems = myTravelDetail
        .firstWhere((travel) => travel.travelId == travelId)
        .items;
    items.clear();
    items.addAll(travelItems);
  }

  changeScreenHeight(double screenHeight) {
    _screenHeight = screenHeight;
  }

  _addItemKeys() async {
    for (int index = 0; index < items.length; index++) {
      itemKeys[index] = GlobalKey();
    }
  }

  _onScroll() async {
    for (int i = visibleItems.last; i < items.length; i++) {
      if (visibleItems.contains(i)) continue;

      final key = itemKeys[i];
      if (key == null) continue;

      final RenderObject? renderObject = key.currentContext?.findRenderObject();
      if (renderObject is RenderBox) {
        final position = renderObject.localToGlobal(Offset.zero).dy;

        if (position < _screenHeight * 0.9) {
          visibleItems.add(i);
          listKey.currentState?.insertItem(i);
        }
      }
    }
  }
}
