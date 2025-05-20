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
  final double _horizontalScrollSpeed = 0.5;
  final isVerticalScrollable = true.obs;
  bool _isDisposed = false;

  detectBookScroll({
    required PointerSignalEvent pointerSignal,
    required double horizontalY,
    required double horizontalHeight,
  }) async {
    if (_isDisposed) return;

    if (pointerSignal is PointerScrollEvent) {
      final currentPosition = verticalController.offset;

      if (_isScrollingDown(
        pointerSignal: pointerSignal,
        currentPosition: currentPosition,
        horizontalY: horizontalY,
        horizontalHeight: horizontalHeight,
      )) {
        _handleScrollingDown(
          pointerSignal: pointerSignal,
          horizontalY: horizontalY,
        );
      } else if (_isScrollingUp(
        pointerSignal: pointerSignal,
        currentPosition: currentPosition,
        horizontalY: horizontalY,
      )) {
        _handleScrollingUp(
          pointerSignal: pointerSignal,
          horizontalY: horizontalY,
        );
      }

      _handleEndState(
        currentPosition: currentPosition,
        horizontalY: horizontalY,
      );
      _updateScrollPosition();
    }
  }

  bool _isScrollingDown({
    required PointerScrollEvent pointerSignal,
    required double currentPosition,
    required double horizontalY,
    required double horizontalHeight,
  }) {
    return pointerSignal.scrollDelta.dy > 0 &&
        currentPosition >= horizontalY &&
        currentPosition < horizontalY + horizontalHeight;
  }

  bool _isScrollingUp({
    required PointerScrollEvent pointerSignal,
    required double currentPosition,
    required double horizontalY,
  }) {
    return pointerSignal.scrollDelta.dy < 0 && currentPosition <= horizontalY;
  }

  void _handleScrollingDown({
    required PointerScrollEvent pointerSignal,
    required double horizontalY,
  }) {
    if (_isHorizontalScrollState == ScrollState.init) {
      _isHorizontalScrollState = ScrollState.scrolling;
    }

    if (_isHorizontalScrollState == ScrollState.scrolling) {
      _updateHorizontalProgress(delta: pointerSignal.scrollDelta.dy);
      _handleScrollingDownState(horizontalY: horizontalY);
    }
  }

  void _handleScrollingUp({
    required PointerScrollEvent pointerSignal,
    required double horizontalY,
  }) {
    if (_isHorizontalScrollState != ScrollState.init) {
      _updateHorizontalProgress(delta: pointerSignal.scrollDelta.dy);
      _handleScrollingUpState();
    }
  }

  void _updateHorizontalProgress({required double delta}) {
    _horizontalProgress += delta * _horizontalScrollSpeed;
    if (_horizontalProgress < 0) {
      _horizontalProgress = 0;
    }
  }

  void _handleScrollingDownState({required double horizontalY}) {
    if (isVerticalScrollable.value) {
      _fixScrollPosition(horizontalY: horizontalY);
    }

    if (_horizontalProgress >
        bookScrollController.position.maxScrollExtent - 10) {
      isVerticalScrollable.value = true;
      _isHorizontalScrollState = ScrollState.end;
    }
  }

  void _handleScrollingUpState() {
    if (_isHorizontalScrollState == ScrollState.end) {
      _isHorizontalScrollState = ScrollState.scrolling;
    }

    if (_horizontalProgress < 0) {
      isVerticalScrollable.value = true;
      _horizontalProgress = 0;
      _isHorizontalScrollState = ScrollState.init;
    }
  }

  void _handleEndState({
    required double currentPosition,
    required double horizontalY,
  }) {
    if (currentPosition < horizontalY &&
        _isHorizontalScrollState == ScrollState.end) {
      _isHorizontalScrollState = ScrollState.scrolling;
      _fixScrollPosition(horizontalY: horizontalY);
    }
  }

  void _updateScrollPosition() {
    if (_isHorizontalScrollState == ScrollState.init) {
      bookScrollController.jumpTo(0);
    } else {
      bookScrollController.jumpTo(_horizontalProgress);
    }
  }

  void _fixScrollPosition({required double horizontalY}) {
    if (_isDisposed) return;
    isVerticalScrollable.value = false;
    verticalController.jumpTo(horizontalY);
  }

  @override
  void onClose() {
    _isDisposed = true;
    verticalController.dispose();
    bookScrollController.dispose();
    super.onClose();
  }
}
