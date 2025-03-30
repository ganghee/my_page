import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:my/book/book_scroll_controller.dart';

class BookBackgroundScrollController extends GetxController {
  late final ScrollController bookBackgroundController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    final bookScrollController = Get.find<BookScrollController>().bookScrollController;
    bookScrollController.addListener(() {
      bookBackgroundController.jumpTo(bookScrollController.offset * 0.5);
    });
  }

  @override
  void onClose() {
    bookBackgroundController.dispose();
    super.onClose();
  }
}
