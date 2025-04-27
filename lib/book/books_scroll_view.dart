part of 'book_screen.dart';

class _BooksScrollView extends StatelessWidget {
  final GlobalKey horizontalKey;

  const _BooksScrollView({required this.horizontalKey});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      height: screenHeight(context),
      child: Stack(
        children: [
          _BookBackgroundView(),
          GridView(
            key: horizontalKey,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            controller: Get.find<BookScrollController>().bookScrollController,
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
              child: ImageView(
                imageUrl: 'assets/images/book/book.webp',
                fit: BoxFit.cover,
                repeat: true,
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
              ImageView(
                imageUrl: widget.bookVo.coverImage,
                width: bookHeight * 2 / 3,
                height: bookHeight,
                fit: BoxFit.cover,
              ),
              _isHover
                  ? Container(
                      width: bookHeight * 2 / 3,
                      height: bookHeight,
                      color: Color(0x66000000),
                      padding: EdgeInsets.all(8),
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
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              'read_date'.trParams({
                                'year': widget.bookVo.date.year.toString(),
                                'month': widget.bookVo.date.month.toString(),
                                'day': widget.bookVo.date.day.toString()
                              })
                            ,
                              style: TextStyle(color: Colors.white),
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
