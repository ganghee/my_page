import 'package:get/get.dart';
import 'package:my/baking/baking_controller.dart';
import 'package:my/baking/baking_background_color_controller.dart';
import 'package:my/baking/baking_list_scroll_contoller.dart';
import 'package:my/baking/baking_recipe_animation_controller.dart';
import 'package:my/baking/baking_rotation_animation_controller.dart';
import 'package:my/baking/baking_name_animation_controller.dart';

class BakingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BakingController>(
      () => BakingController(),
    );
    Get.lazyPut<BakingBackgroundColorController>(
      () => BakingBackgroundColorController(),
    );
    Get.lazyPut<BakingListScrollController>(
      () => BakingListScrollController(),
    );
    Get.lazyPut<BakingRecipeAnimationController>(
      () => BakingRecipeAnimationController(),
    );
    Get.lazyPut<BakingRotationAnimationController>(
      () => BakingRotationAnimationController(),
    );
    Get.lazyPut<BakingNameAnimationController>(
      () => BakingNameAnimationController(),
    );
  }
}
