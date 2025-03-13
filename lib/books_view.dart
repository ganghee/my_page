part of './scroll_list_view.dart';

Widget booksView({
  required double screenHeight,
  required GlobalKey horizontalKey,
  required ScrollController bookScrollController,
}) {
  return Container(
    color: Colors.black,
    height: screenHeight,
    child: Stack(
      children: [
        _BookBackgroundView(bookScrollController: bookScrollController),
        GridView(
          key: horizontalKey,
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          controller: bookScrollController,
          padding: const EdgeInsets.symmetric(horizontal: 60),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 0.7,
          ),
          children: myBooks
              .mapIndexed(
                (index, bookVo) => _BookItemView(bookVo: bookVo, index: index),
              )
              .toList(),
        ),
      ],
    ),
  );
}

class _BookBackgroundView extends StatefulWidget {
  final ScrollController bookScrollController;

  const _BookBackgroundView({required this.bookScrollController});

  @override
  State<_BookBackgroundView> createState() => _BookBackgroundViewState();
}

class _BookBackgroundViewState extends State<_BookBackgroundView> {
  final ScrollController _bookBackgroundController = ScrollController();

  @override
  void initState() {
    widget.bookScrollController.addListener(() {
      _bookBackgroundController
          .jumpTo(widget.bookScrollController.offset * 0.5);
    });
    super.initState();
  }

  @override
  void dispose() {
    _bookBackgroundController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: _bookBackgroundController,
      scrollDirection: Axis.horizontal,
      children: List.generate(
        30,
        (_) => Opacity(
          opacity: 0.5,
          child: Image.network(
            'https://i.postimg.cc/k48Q3YJk/Screenshot-2025-03-04-at-3-00-07-AM.png',
            fit: BoxFit.cover,
            repeat: ImageRepeat.repeat,
          ),
        ),
      ),
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

class _BookItemViewState extends State<_BookItemView> with SingleTickerProviderStateMixin {
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
    final screenHeight = MediaQuery.of(context).size.height;
    final bookHeight = screenHeight / 3 - 60;

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
                    child: Center(
                      child: Text(
                        widget.bookVo.title,
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
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
