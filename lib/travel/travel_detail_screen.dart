import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my/travel/travel_detail_ui_controller.dart';
import 'package:my/travel/travel_detail_vo.dart';
import 'package:my/travel/travel_main_ui_controller.dart';
import 'package:my/util/size.dart';

class TravelDetailScreen extends StatelessWidget {
  final int travelId;

  const TravelDetailScreen({super.key, required this.travelId});

  @override
  Widget build(BuildContext context) {
    final travelMainUIController = Get.find<TravelMainUIController>();
    final travelDetailUIController = Get.put(TravelDetailUIController());

    travelDetailUIController.setTravelItems(travelId);
    travelDetailUIController.changeScreenHeight(screenHeight(context));

    return PopScope(
      onPopInvokedWithResult: (_, __) {
        travelMainUIController.onBeforeRoute();
      },
      child: Scaffold(
        body: AnimatedList(
          key: travelDetailUIController.listKey,
          controller: travelDetailUIController.scrollController,
          initialItemCount: travelDetailUIController.items.length,
          itemBuilder: (context, index, animation) {
            if (index > travelDetailUIController.items.length - 1) {
              return Container();
            }
            return itemView(
              index: index,
              animation: animation,
            );
          },
        ),
      ),
    );
  }

  Widget itemView({
    required int index,
    required Animation<double> animation,
  }) {
    final controller = Get.find<TravelDetailUIController>();

    return Obx(
      () => AnimatedOpacity(
        key: controller.itemKeys[index],
        opacity: controller.visibleItems.contains(index) ? 1.0 : 0.0,
        duration: Duration(milliseconds: 1000),
        child: SlideTransition(
          position: Tween<Offset>(
            begin: Offset(0, 0.5),
            end: Offset(0, 0),
          ).animate(animation),
          child: _travelItemView(controller.items[index]),
        ),
      ),
    );
  }

  Widget _travelItemView(TravelItemVo item) {
    switch (item.type) {
      case TravelDetailType.image:
        return Image.network(item.description);
      case TravelDetailType.text:
        return Text(
          item.description,
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        );
    }
  }
}
