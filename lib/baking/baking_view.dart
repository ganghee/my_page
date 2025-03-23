import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my/baking/baking_background_color_controller.dart';
import 'package:my/baking/baking_list_scroll_contoller.dart';
import 'package:my/baking/baking_recipe_animation_controller.dart';
import 'package:my/baking/baking_rotation_animation_controller.dart';
import 'package:my/baking/baking_vo.dart';

import 'baking_controller.dart';
import 'baking_name_animation_controller.dart';

part 'baking_list_view.dart';

part 'baking_name_view.dart';

part 'baking_recipe_view.dart';

part 'baking_rotation_view.dart';

class BakingView extends StatelessWidget {
  const BakingView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(BakingController());
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          _backgroundView(context),
          _BakingRotationView(),
          _BakingNameView(),
          _BakingRecipeView(),
          _BakingListView(),
        ],
      ),
    );
  }

  Widget _backgroundView(BuildContext context) {
    return GetBuilder(
      init: BakingBackgroundColorController(),
      builder: (controller) {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: controller.colorAnimation.value ?? Colors.white,
        );
      },
    );
  }
}
