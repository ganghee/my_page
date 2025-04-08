import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my/book/book_background_scroll_controller.dart';
import 'package:my/book/book_scroll_controller.dart';
import 'package:my/book/book_vo.dart';
import 'package:my/util/image_view.dart';
import 'package:my/util/size.dart';
import 'package:collection/collection.dart';

part 'books_scroll_view.dart';

class BookScreen extends StatefulWidget {
  const BookScreen({super.key});

  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  final GlobalKey _horizontalKey = GlobalKey();
  double _horizontalY = 0; // 세로 스크롤 position에서 BooksScrollView 시작 위치
  double _horizontalHeight = 0; // BooksScrollView 높이

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
    final controller = Get.put(BookScrollController());

    return Scaffold(
      body: Listener(
        onPointerSignal: (pointerSignal) {
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
            child: _BooksScrollView(horizontalKey: _horizontalKey),
          ),
        ),
      ),
    );
  }
}
