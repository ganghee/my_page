import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

enum ScrollState {
  init,
  scrolling,
  end,
}

class BookScrollController extends GetxController {
  double _horizontalProgress = 0.0;
  ScrollState _isHorizontalScrollState = ScrollState.init;
  late final ScrollController verticalController = ScrollController();
  late final ScrollController bookScrollController = ScrollController();
  final _horizontalScrollSpeed = 0.5;
  final isVerticalScrollable = true.obs;

  // 책 가로 스크롤 이벤트 감지
  detectBookScroll({
    required PointerSignalEvent pointerSignal,
    required double horizontalY,
    required double horizontalHeight,
  }) async {
    if (pointerSignal is PointerScrollEvent) {
      final currentPosition = verticalController.offset; // 현재 위치
      // 스크롤 위치가 가로 스크롤 위치에 있을 때
      // 아래로 스크롤 시
      if (pointerSignal.scrollDelta.dy > 0 &&
          currentPosition >= horizontalY &&
          currentPosition < horizontalY + horizontalHeight) {
        if (_isHorizontalScrollState == ScrollState.init) {
          _isHorizontalScrollState = ScrollState.scrolling;
        }
        if (_isHorizontalScrollState == ScrollState.scrolling) {
          _horizontalProgress +=
              pointerSignal.scrollDelta.dy * _horizontalScrollSpeed;

          if (isVerticalScrollable.value) {
            await _fixScrollPosition(horizontalY: horizontalY);
          }
          if (_horizontalProgress < 0) {
            _horizontalProgress = 0;
          }

          // 가로 스크롤이 끝에 도달했을 때
          if (_horizontalProgress >
              bookScrollController.position.maxScrollExtent - 10) {
            isVerticalScrollable.value = true;
            _isHorizontalScrollState = ScrollState.end;
          }
        }
        // 위로 스크롤 시
      } else if ((pointerSignal.scrollDelta.dy < 0 &&
          currentPosition <= horizontalY)) {
        if (_isHorizontalScrollState != ScrollState.init)  {
          _horizontalProgress +=
              pointerSignal.scrollDelta.dy * _horizontalScrollSpeed;
          if(_isHorizontalScrollState == ScrollState.end) {
            _isHorizontalScrollState = ScrollState.scrolling;
          }
          // 가로 스크롤이 초기 상태로 되돌아 왔을 때
          if (_horizontalProgress < 0) {
            isVerticalScrollable.value = true;
            _horizontalProgress = 0;
            _isHorizontalScrollState = ScrollState.init;
          }
        }
      }
      if (currentPosition < horizontalY &&
          _isHorizontalScrollState == ScrollState.end) {
        _isHorizontalScrollState = ScrollState.scrolling;
        await _fixScrollPosition(horizontalY: horizontalY);
      }
      if (_isHorizontalScrollState == ScrollState.init) {
        bookScrollController.jumpTo(0);
      } else {
        bookScrollController.jumpTo(_horizontalProgress);
      }
    }
  }

  // 스크롤 위치를 고정시키는 함수
  _fixScrollPosition({required double horizontalY}) async {
    isVerticalScrollable.value = false;
    verticalController.jumpTo(horizontalY);
    await Future.delayed(Duration(milliseconds: 5)); // 5ms 딜레이를 줘야 정상적으로 동작함
    verticalController.jumpTo(horizontalY);
  }
}
