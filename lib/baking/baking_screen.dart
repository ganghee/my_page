import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my/baking/baking_background_color_controller.dart';
import 'package:my/baking/baking_list_scroll_contoller.dart';
import 'package:my/baking/baking_recipe_animation_controller.dart';
import 'package:my/baking/baking_rotation_animation_controller.dart';
import 'package:my/baking/baking_vo.dart';
import 'package:my/util/image_view.dart';
import 'package:my/util/size.dart';

import 'baking_controller.dart';
import 'baking_name_animation_controller.dart';

part 'baking_list_view.dart';

part 'baking_name_view.dart';

part 'baking_recipe_view.dart';

part 'baking_rotation_view.dart';

class BakingScreen extends StatelessWidget {
  const BakingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(BakingController());
    return Scaffold(
      body: SizedBox(
        width: screenWidth(context),
        height: screenHeight(context),
        child: Hero(
          tag: 'answer',
          child: Stack(
            children: [
              _backgroundView(context),
              _BakingRotationView(),
              _BakingNameView(),
              _BakingRecipeView(),
              _BakingListView(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _backgroundView(BuildContext context) {
    return Stack(
      children: [
        GetBuilder(
          init: BakingBackgroundColorController(),
          builder: (controller) {
            return AnimatedBuilder(
              animation: controller.colorAnimation,
              builder: (BuildContext context, Widget? child) {
                return Container(
                  width: screenWidth(context),
                  height: screenHeight(context),
                  color: controller.colorAnimation.value ?? Colors.white,
                );
              },
            );
          },
        ),
        Align(
          alignment: Alignment(-1.55, -5.5),
          child: CircleAvatar(
            radius: screenWidth(context) / 4,
            backgroundColor: Colors.white,
          ),
        ),
      ],
    );
  }
}
