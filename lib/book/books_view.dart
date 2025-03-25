import 'dart:math';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my/book/book_background_scroll_controller.dart';
import 'package:my/book/book_vo.dart';
import 'package:my/main_scroll_controller.dart';
import 'package:my/util/size.dart';

class BooksView extends StatelessWidget {
  final double screenHeight;
  final GlobalKey horizontalKey;

  const BooksView({
    super.key,
    required this.screenHeight,
    required this.horizontalKey,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      height: screenHeight,
      child: Stack(
        children: [
          _BookBackgroundView(),
          GridView(
            key: horizontalKey,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            controller: Get.find<MainScrollController>().bookScrollController,
            padding: const EdgeInsets.symmetric(horizontal: 60),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.7,
            ),
            children: myBooks
                .mapIndexed(
                  (index, bookVo) =>
                      _BookItemView(bookVo: bookVo, index: index),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _BookBackgroundView extends StatelessWidget {
  const _BookBackgroundView();

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: BookBackgroundScrollController(),
      builder: (controller) {
        return ListView(
          controller: controller.bookBackgroundController,
          scrollDirection: Axis.horizontal,
          children: List.generate(
            30,
            (_) => Opacity(
              opacity: 0.5,
              child: Image.asset(
                'assets/images/book.png',
                fit: BoxFit.cover,
                repeat: ImageRepeat.repeat,
              ),
            ),
          ),
        );
      },
    );
  }
}

class _BookItemView extends StatefulWidget {
  final BookVo bookVo;
  final int index;

  const _BookItemView({required this.bookVo, required this.index});

  @override
  State<_BookItemView> createState() => _BookItemViewState();
}

class _BookItemViewState extends State<_BookItemView>
    with SingleTickerProviderStateMixin {
  bool _isHover = false;
  late final AnimationController _animationController = AnimationController(
    duration: Duration(seconds: Random().nextInt(3) + 1),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<Offset> _animation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(0, 0.08),
  ).animate(_animationController);

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bookHeight = screenHeight(context) / 3 - 60;

    // 두 번째 줄은 오른쪽 정렬
    return Container(
      key: ValueKey(widget.index),
      alignment:
          widget.index % 3 == 1 ? Alignment.centerRight : Alignment(-0.7, 0),
      padding: EdgeInsets.all(8),
      child: MouseRegion(
        onHover: (event) {
          setState(() {
            _isHover = true;
          });
        },
        onExit: (event) {
          setState(() {
            _isHover = false;
          });
        },
        child: SlideTransition(
          position: _animation,
          child: Stack(
            children: [
              Image.network(
                widget.bookVo.coverImage,
                width: bookHeight * 2 / 3,
                height: bookHeight,
                fit: BoxFit.cover,
              ),
              _isHover
                  ? Container(
                      width: bookHeight * 2 / 3,
                      height: bookHeight,
                      color: Color(0x66000000),
                      child: Stack(
                        children: [
                          Center(
                            child: Text(
                              widget.bookVo.title,
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              '읽은 날\n${widget.bookVo.date.year}년 ${widget.bookVo.date.month}월 ${widget.bookVo.date.day}일',
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.end,
                            ),
                          )
                        ],
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
