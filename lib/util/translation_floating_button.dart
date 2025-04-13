import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my/util/image_view.dart';

Widget TranslationFloatingButton() {
  bool isEnglish = Get.locale == Locale('en', 'US');

  return FloatingActionButton(
    tooltip: isEnglish ? '한국어로 번역하기' : 'Translate to English',
    backgroundColor: Colors.white,
    onPressed: () {
      if (isEnglish) {
        Get.updateLocale(Locale('ko', 'KR'));
      } else {
        Get.updateLocale(Locale('en', 'US'));
      }
    },
    child: ImageView(
      imageUrl: isEnglish
          ? 'assets/icon/translation_kr.webp'
          : 'assets/icon/translation_kr.webp',
      width: 40,
      height: 40,
      fit: BoxFit.cover,
    ),
  );
}

