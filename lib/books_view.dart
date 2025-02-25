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
            (index, bookVo) => MouseRegion(
              onHover: (event) {
              },
              child: Container(
                color: Colors.black,
                alignment: index % 3 == 1
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                padding: EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      bookVo.coverImage,
                      width: 100,
                      height: 150,
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
            ),
          )
          .toList(),
    ),
  );
}
