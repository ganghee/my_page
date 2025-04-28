import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    child: Icon(Icons.translate, color: Colors.black),
  );
}
