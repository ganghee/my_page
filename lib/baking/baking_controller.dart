import 'package:get/get.dart';

class BakingController extends GetxController {
  var focusIndex = 0;

  changeFocusIndex(int index) {
    focusIndex = index;
    update();
  }
}
