import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my/travel/model/travel_detail_vo.dart';
import 'package:my/travel/model/travel_vo.dart';
import 'package:my/travel/travel_detail_ui_controller.dart';
import 'package:my/travel/travel_main_ui_controller.dart';
import 'package:my/util/image_view.dart';
import 'package:my/util/size.dart';

class TravelDetailScreen extends StatelessWidget {
  const TravelDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final travelMainUIController = Get.find<TravelMainUIController>();
    final travelDetailUIController = Get.find<TravelDetailUIController>();
    final travelId =
        Get.arguments ?? int.parse(Get.parameters['travelId'] ?? '0');

    travelDetailUIController.changeScreenHeight(screenHeight(context));
    travelDetailUIController.setTravelItems(travelId);

    return PopScope(
      onPopInvokedWithResult: (_, __) {
        travelMainUIController.onBeforeRoute();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: AnimatedList.separated(
          key: travelDetailUIController.listKey,
          controller: travelDetailUIController.scrollController,
          initialItemCount: travelDetailUIController.items.length,
          itemBuilder: (context, index, animation) {
            if (index >= travelDetailUIController.items.length) {
              return SizedBox();
            } else {
              return Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Visibility(
                      visible: index == 0,
                      child: GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          if (Get.locale == Locale('en', 'US')) {
                            Get.updateLocale(Locale('ko', 'KR'));
                          } else {
                            Get.updateLocale(Locale('en', 'US'));
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(6),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(Icons.translate),
                              SizedBox(width: 10),
                              Text(
                                Get.locale == Locale('en', 'US')
                                    ? '번역하기'
                                    : 'Translate',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  itemView(
                    index: index,
                    animation: animation,
                    travelId: travelId,
                  ),
                ],
              );
            }
          },
          separatorBuilder: (_, index, __) => Visibility(
            visible: index <= travelDetailUIController.items.length,
            child: SizedBox(height: 40),
          ),
          removedSeparatorBuilder: (_, __, ___) => SizedBox(height: 20),
          shrinkWrap: true,
          padding: const EdgeInsets.only(top: 20, bottom: 20),
        ),
      ),
    );
  }

  Widget itemView({
    required int index,
    required Animation<double> animation,
    required int travelId,
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
          child: Column(
            children: [
              Visibility(
                visible: index == 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 80),
                  child: Text(
                    myTravel
                        .where(
                          (travel) => travel.travelId == travelId,
                        )
                        .first
                        .title
                        .tr,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              _travelItemView(controller.items[index]),
            ],
          ),
        ),
      ),
    );
  }

  Widget _travelItemView(TravelItemVo item) {
    switch (item.type) {
      case TravelDetailType.image:
        if (item.imageUrls.isNotEmpty) {
          return _imageItemView(item);
        } else {
          return ImageView(
            imageUrl: item.description,
            fit: BoxFit.cover,
          );
        }

      case TravelDetailType.text:
        return Text(
          item.description.tr,
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        );
    }
  }

  Widget _imageItemView(TravelItemVo item) {
    return Builder(
      builder: (context) {
        return SizedBox(
          width: screenWidth(context) > 1000 ? 1000 : screenWidth(context),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: item.imageUrls
                .map(
                  (url) => Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: ImageView(
                        imageUrl: url,
                        width: screenWidth(context) / item.imageUrls.length,
                        cacheHeight: 1000,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        );
      },
    );
  }
}
