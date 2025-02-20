part of './scroll_list_view.dart';

Widget booksView({
  required double screenHeight,
  required GlobalKey horizontalKey,
  required ScrollController horizontalController,
}) {
  return SizedBox(
    height: screenHeight,
    child: GridView(
        key: horizontalKey,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        controller: horizontalController,
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1.5,
        ),
        children: myBooks
            .map(
              (bookVo) => Container(
                color: Colors.grey[200],
                alignment: Alignment.center,
                margin: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      'https://picsum.photos/250?image=9',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      bookVo.title,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            )
            .toList()),
  );
}
