import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:my/book/book_background_scroll_controller.dart';
import 'package:my/book/book_screen.dart';
import 'package:my/book/book_scroll_controller.dart';
import 'package:my/travel/travel_main_ui_controller.dart';
import 'package:my/travel/travel_screen.dart';

void main() {
  group(('BookScreen'), () {
    testWidgets(('책 화면(BookScreen)에서 스크롤 시 배경 움직임은 1/2 속도로 스크롤 된다.'),
        (WidgetTester tester) async {
      //given
      await tester.pumpWidget(
        const MaterialApp(home: BookScreen()),
      );
      final bookScrollController = Get.put(BookScrollController());
      final bookBackgroundScrollController =
          Get.put(BookBackgroundScrollController());

      // when
      bookScrollController.bookScrollController.jumpTo(100);

      // then
      expect(
        bookBackgroundScrollController.bookBackgroundController.offset,
        50,
      );
    });

    testWidgets('책 화면(BookScreen)에서 100만큼 스크롤 시 100 이동 확인',
        (WidgetTester tester) async {
      Get.deleteAll();

      // given
      await tester.pumpWidget(
        const MaterialApp(home: BookScreen()),
      );
      final bookScrollController = Get.put(BookScrollController());

      // when
      bookScrollController.bookScrollController.jumpTo(100);

      // then
      expect(
        bookScrollController.bookScrollController.offset,
        100,
      );
    });

    testWidgets(
        '책 화면(BookScreen)에서 아래로 스크롤 100 이동 시 책 리스트는 움직임의 반인 50 오른쪽으로 움직임',
        (WidgetTester tester) async {
      Get.deleteAll();
      // given
      await tester.pumpWidget(
        const MaterialApp(home: BookScreen()),
      );
      final bookScrollController = Get.put(BookScrollController());

      // when
      await bookScrollController.detectBookScroll(
        pointerSignal: const PointerScrollEvent(
          scrollDelta: Offset(0, 100),
        ),
        horizontalY: 0,
        horizontalHeight: 100,
      );

      // then
      expect(bookScrollController.bookScrollController.offset, 50);
    });

    testWidgets(
        '책 화면(BookScreen)에서 오른쪽으로 100 이동된 상테에서 위로 스크롤 100 이동 시 책 리스트는 움직임의 반인 50 왼쪽으로 움직임',
        (WidgetTester tester) async {
      // given
      Get.deleteAll();

      await tester.pumpWidget(
        const MaterialApp(home: BookScreen()),
      );
      final bookScrollController = Get.put(BookScrollController());
      await bookScrollController.detectBookScroll(
        pointerSignal: const PointerScrollEvent(
          scrollDelta: Offset(0, 200),
        ),
        horizontalY: 0,
        horizontalHeight: 100,
      );

      // when
      await bookScrollController.detectBookScroll(
        pointerSignal: const PointerScrollEvent(
          scrollDelta: Offset(0, -100),
        ),
        horizontalY: 0,
        horizontalHeight: 100,
      );

      // then
      expect(bookScrollController.bookScrollController.offset, 50);
    });
  });

  group(('TravelScreen'), () {
    testWidgets('onChangeHoveredIndex 테스트', (WidgetTester tester) async {
      // given
      await tester.pumpWidget(
        const MaterialApp(home: TravelScreen()),
      );
      final bookScrollController = Get.put(TravelMainUIController());

      // when
      bookScrollController.onChangeHoveredIndex(1);

      // then
      expect(bookScrollController.hoveredIndex.value, 1);
    });

    testWidgets('메인 여행 리스트 드레그앤 드롭 onDragUpdate 테스트',
        (WidgetTester tester) async {
      // given
      await tester.pumpWidget(
        const MaterialApp(home: TravelScreen()),
      );
      final travelMainUIController = Get.put(TravelMainUIController());
      travelMainUIController.scrollController.jumpTo(1000);

      // when
      travelMainUIController.onDragUpdate(
        DragUpdateDetails(
          delta: Offset(100, 0),
          globalPosition: Offset(0, 0),
        ),
      );

      //then
      expect(
        travelMainUIController.scrollController.offset,
        900,
      );
    });
  });
}
