part of './scroll_list_view.dart';

Widget bakingView() {
  return Builder(builder: (context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: _BakingView(),
    );
  });
}

class _BakingView extends StatefulWidget {
  const _BakingView();

  @override
  State<_BakingView> createState() => _BakingViewState();
}

class _BakingViewState extends State<_BakingView> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        bakingMainView(),
        bakingDetailView(),
        bakingListView(),
      ],
    );
  }

  Widget bakingMainView() {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        width: MediaQuery.of(context).size.width * 2 / 3,
        height: MediaQuery.of(context).size.height / 2,
        color: Colors.blue,
      ),
    );
  }

  Widget bakingDetailView() {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.only(right: 100),
        width: MediaQuery.of(context).size.width / 3,
        height: MediaQuery.of(context).size.height / 2,
        color: Colors.red,
      ),
    );
  }

  Widget bakingListView() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        margin: EdgeInsets.only(bottom: 300, left: 100),
        width: MediaQuery.of(context).size.width / 2,
        height: MediaQuery.of(context).size.height / 4,
        color: Colors.orange,
      ),
    );
  }
}
