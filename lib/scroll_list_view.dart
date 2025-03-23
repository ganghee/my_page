import 'dart:math';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my/baking/baking_view.dart';
import 'package:my/book/book_background_scroll_controller.dart';
import 'package:my/main_scroll_controller.dart';

import 'book/book_vo.dart';

part 'book/books_view.dart';

class ScrollListView extends StatefulWidget {
  const ScrollListView({super.key});

  @override
  State<ScrollListView> createState() => _ScrollListViewState();
}

class _ScrollListViewState extends State<ScrollListView> {
  final GlobalKey _horizontalKey = GlobalKey();
  double _horizontalY = 0; // 가로 스크롤 위치
  double _horizontalHeight = 0; // 가로 스크롤 높이

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final renderBox =
          _horizontalKey.currentContext?.findRenderObject() as RenderBox?;
      _horizontalY = renderBox?.localToGlobal(Offset.zero).dy ?? 0;
      _horizontalHeight = renderBox?.size.height ?? 0;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MainScrollController());

    return Listener(
      onPointerSignal: (pointerSignal) async {
        /// 스크롤 이벤트 감지
        /// detect scroll event
        controller.detectBookScroll(
          pointerSignal: pointerSignal,
          horizontalY: _horizontalY,
          horizontalHeight: _horizontalHeight,
        );
      },
      child: Obx(
        () => SingleChildScrollView(
          controller: controller.verticalController,
          physics: controller.isVerticalScrollable.value
              ? null
              : const NeverScrollableScrollPhysics(),
          child: Column(
            children: List.generate(4, (index) {
              if (index == 0) {
                return BakingView();
              } else if (index == 1) {
                return _booksView(
                  screenHeight: MediaQuery.of(context).size.height,
                  horizontalKey: _horizontalKey,
                  bookScrollController: controller.bookScrollController,
                );
              } else {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.blue,
                  child: Text("안녕하세요"),
                );
              }
            }),
          ),
        ),
      ),
    );
  }
}
