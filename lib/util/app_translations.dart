import 'package:get/get.dart';
import 'package:my/question/question_vo.dart';
import 'package:my/travel/model/travel_detail_vo.dart';
import 'package:my/travel/model/travel_vo.dart';

import '../baking/baking_vo.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys {
    final Map<String, String> korean = {};
    final Map<String, String> english = {};

    // Question and Answer
    for (var questionVo in myQuestion) {
      korean.addAll({questionVo.question: questionVo.question});
      korean.addAll({questionVo.answer: questionVo.answer});
      english.addAll({questionVo.question: questionVo.questionEnglish});
      english.addAll({questionVo.answer: questionVo.answerEnglish});
    }

    // read book
    korean.addAll({'read_date': '읽은 날\n@year년 @month월 @day일'});
    english.addAll({'read_date': 'Read on\n@month/@day/@year'});

    // baking
    korean.addAll({'재료': '재료'});
    english.addAll({'재료': 'ingredients'});
    korean.addAll({'레시피': '레시피'});
    english.addAll({'레시피': 'recipe'});

    for (var bakingVo in bakings) {
      korean.addAll({bakingVo.name: bakingVo.name});
      english.addAll({bakingVo.name: bakingVo.nameEnglish});
      korean.addAll({bakingVo.ingredients: bakingVo.ingredients});
      english.addAll({bakingVo.ingredients: bakingVo.ingredientsEnglish});
      for (int i = 0; i < bakingVo.recipe.length; i++) {
        korean.addAll({'${bakingVo.name}recipe$i': bakingVo.recipe[i]});
        english.addAll({'${bakingVo.name}recipe$i': bakingVo.recipeEnglish[i]});
      }
    }

    // travel
    for (var travelVo in myTravel) {
      korean.addAll({travelVo.title: travelVo.title});
      english.addAll({travelVo.title: travelVo.titleEnglish});
    }
    for (var travelDetailVo in myTravelDetail) {
      for (var travelItemVo in travelDetailVo.items) {
        korean.addAll({travelItemVo.description: travelItemVo.description});
        english.addAll({
          travelItemVo.description: travelItemVo.descriptionEnglish
        });
      }
    }

    return {
      'ko_KR': korean,
      'en_US': english,
    };
  }
}
