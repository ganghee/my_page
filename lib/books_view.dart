part of './scroll_list_view.dart';

Widget booksView({
  required double screenHeight,
  required GlobalKey horizontalKey,
  required ScrollController horizontalController,
}) {
  return Container(
    color: Colors.black,
    height: screenHeight,
    child: GridView(
      key: horizontalKey,
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      controller: horizontalController,
      padding: const EdgeInsets.symmetric(horizontal: 60),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.7,
      ),
      children: myBooks
          .mapIndexed(
              (index, bookVo) => _BookItemView(bookVo: bookVo, index: index))
          .toList(),
    ),
  );
}

class _BookItemView extends StatefulWidget {
  final BookVo bookVo;
  final int index;

  const _BookItemView({required this.bookVo, required this.index});

  @override
  State<_BookItemView> createState() => _BookItemViewState();
}

class _BookItemViewState extends State<_BookItemView> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final bookHeight = screenHeight / 3 - 60;

    return Container(
      color: Colors.black,
      alignment:
          widget.index % 3 == 1 ? Alignment.centerRight : Alignment(-0.7, 0),
      padding: EdgeInsets.all(8),
      child: MouseRegion(
        onHover: (event) {
          setState(() {
            isHover = true;
          });
        },
        onExit: (event) {
          setState(() {
            isHover = false;
          });
        },
        child: Stack(
          children: [
            Image.network(
              widget.bookVo.coverImage,
              width: bookHeight * 2 / 3,
              height: bookHeight,
              fit: BoxFit.cover,
            ),
            isHover
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
    );
  }
}
