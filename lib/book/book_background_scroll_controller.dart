import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class BookBackgroundScrollController extends GetxController {
  late final ScrollController bookBackgroundController = ScrollController();

  @override
  void onClose() {
    bookBackgroundController.dispose();
    super.onClose();
  }

  slowMoveBackground(ScrollController bookScrollController) {
    bookScrollController.addListener(() {
      bookBackgroundController.jumpTo(bookScrollController.offset * 0.5);
    });
  }
}
