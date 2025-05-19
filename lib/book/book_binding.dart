import 'package:get/get.dart';
import 'package:my/book/book_scroll_controller.dart';
import 'package:my/book/book_background_scroll_controller.dart';

class BookBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookScrollController>(() => BookScrollController());
    Get.lazyPut<BookBackgroundScrollController>(
      () => BookBackgroundScrollController(),
    );
  }
}
