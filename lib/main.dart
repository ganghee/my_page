import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my/baking/baking_binding.dart';
import 'package:my/book/book_binding.dart';
import 'package:my/question/question_binding.dart';
import 'package:my/question/question_screen.dart';
import 'package:my/travel/travel_binding.dart';
import 'package:my/travel/travel_detail_screen.dart';
import 'package:my/travel/travel_screen.dart';
import 'package:my/util/app_translations.dart';

import 'baking/baking_screen.dart';
import 'book/book_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: QuestionScreen(),
      translations: AppTranslations(),
      locale: Locale('ko', 'KR'),
      initialBinding: QuestionBinding(),
      getPages: [
        GetPage(
          name: '/travel/:travelId',
          page: () => TravelDetailScreen(),
          binding: TravelDetailBinding(),
        ),
        GetPage(
          name: '/travel',
          page: () => TravelScreen(),
          binding: TravelBinding(),
        ),
        GetPage(
          name: '/question',
          page: () => QuestionScreen(),
          binding: QuestionBinding(),
        ),
        GetPage(
          name: '/baking',
          page: () => BakingScreen(),
          binding: BakingBinding(),
          preventDuplicates: true,
        ),
        GetPage(
          name: '/book',
          page: () => BookScreen(),
          binding: BookBinding(),
        ),
      ],
    );
  }
}
