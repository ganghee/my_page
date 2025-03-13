import 'dart:math';

import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'book_vo.dart';

part 'books_view.dart';

part 'baking_view.dart';

class ScrollListView extends StatefulWidget {
  const ScrollListView({super.key});

  @override
  State<ScrollListView> createState() => _ScrollListViewState();
}

enum ScrollState {
  init,
  scrolling,
  end,
}

class _ScrollListViewState extends State<ScrollListView> {
  final ScrollController _verticalController = ScrollController();
  final ScrollController _bookScrollController = ScrollController();
  final GlobalKey _horizontalKey = GlobalKey();
  final horizontalScrollSpeed = 0.5;
  double _horizontalProgress = 0.0;
  bool _isVerticalScrollable = true;
  double _horizontalY = 0; // 가로 스크롤 위치
  double _horizontalHeight = 0; // 가로 스크롤 높이
  ScrollState _isHorizontalScrollState = ScrollState.init;

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
    return Listener(
      onPointerSignal: (pointerSignal) async {
        /// 스크롤 이벤트 감지
        /// detect scroll event
        await detectBookScroll(pointerSignal);
      },
      child: SingleChildScrollView(
        controller: _verticalController,
        physics:
            _isVerticalScrollable ? null : const NeverScrollableScrollPhysics(),
        child: Column(
          children: List.generate(4, (index) {
            if (index == 0) {
              return bakingView();
            } else if (index == 1) {
              return booksView(
                screenHeight: MediaQuery.of(context).size.height,
                horizontalKey: _horizontalKey,
                bookScrollController: _bookScrollController,
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
    );
  }

  // 스크롤 위치를 고정시키는 함수
  fixScrollPosition() async {
    _isVerticalScrollable = false;
    _verticalController.jumpTo(_horizontalY);
    await Future.delayed(Duration(milliseconds: 5)); // 5ms 딜레이를 줘야 정상적으로 동작함
    _verticalController.jumpTo(_horizontalY);
  }

  // 책 가로 스크롤 이벤트 감지
  detectBookScroll(PointerSignalEvent pointerSignal) async {
    if (pointerSignal is PointerScrollEvent) {
      final currentPosition = _verticalController.offset; // 현재 위치
      // 스크롤 위치가 가로 스크롤 위치에 있을 때
      if (currentPosition >= _horizontalY &&
          currentPosition < _horizontalY + _horizontalHeight) {
        // 아래로 스크롤 시
        if (pointerSignal.scrollDelta.dy > 0) {
          if (_isHorizontalScrollState == ScrollState.init) {
            _isHorizontalScrollState = ScrollState.scrolling;
          }
          if (_isHorizontalScrollState == ScrollState.scrolling) {
            _horizontalProgress +=
                pointerSignal.scrollDelta.dy * horizontalScrollSpeed;
            await fixScrollPosition();
            if (_horizontalProgress < 0) {
              _horizontalProgress = 0;
            }

            if (_horizontalProgress >
                _bookScrollController.position.maxScrollExtent - 10) {
              _isVerticalScrollable = true;
              _isHorizontalScrollState = ScrollState.end;
            }
            setState(() {});
          }
        } else {
          if (_isHorizontalScrollState == ScrollState.scrolling) {
            await fixScrollPosition();
            _horizontalProgress +=
                pointerSignal.scrollDelta.dy * horizontalScrollSpeed;
            // 가로 스크롤이 초기 상태로 되돌아 왔을 때
            if (_horizontalProgress < 0) {
              _isVerticalScrollable = true;
              _horizontalProgress = 0;
              _isHorizontalScrollState = ScrollState.init;
            }
          }
          setState(() {});
        }
      }
      if (currentPosition < _horizontalY &&
          _isHorizontalScrollState == ScrollState.end) {
        _isHorizontalScrollState = ScrollState.scrolling;
        await fixScrollPosition();
      }
      if (_isHorizontalScrollState == ScrollState.end) {
        _bookScrollController
            .jumpTo(_bookScrollController.position.maxScrollExtent);
      } else if (_isHorizontalScrollState == ScrollState.init) {
        _bookScrollController.jumpTo(0);
      } else {
        _bookScrollController.jumpTo(_horizontalProgress);
      }
    }
  }
}
