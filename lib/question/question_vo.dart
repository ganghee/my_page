import 'package:flutter/material.dart';
import 'package:my/baking/baking_screen.dart';
import 'package:my/book/book_screen.dart';
import 'package:my/travel/travel_screen.dart';

class QuestionVo {
  String question;
  String answer;
  Color color;
  Widget? childScreen;

  QuestionVo({
    required this.question,
    required this.answer,
    required this.color,
    this.childScreen,
  });
}

final List<QuestionVo> myQuestion = [
  QuestionVo(
    question: '좋아하는 음식',
    answer: '다 좋아해요',
    color: Colors.red,
  ),
  QuestionVo(
    question: '추천하는 책',
    answer: '구의 증명을 추천해요.',
    color: Colors.blue,
  ),
  QuestionVo(
    question: '요즘 운동하는 것',
    answer: '달리기를 해요',
    color: Colors.green,
  ),
  QuestionVo(
    question: '좋아하는 영화 장르',
    answer: '로맨틱 판타지 장르의 영화를 좋아해요',
    color: Colors.yellow,
  ),
  QuestionVo(
    question: '빵집 추천',
    answer: '성수동의 베이킹 스튜디어를 자주가요 특히 치아바타를 좋아해요',
    color: Colors.purple,
  ),
  QuestionVo(
    question: '읽은 도서',
    answer: '한 달에 한 권은 읽는 것 같아요 여기를 클릭하면 읽은 도서 목록을 볼 수 있어요',
    color: Colors.orange,
    childScreen: BookScreen(),
  ),
  QuestionVo(
    question: '좋아하는 음악 장르',
    answer: '지브리 음악을 좋아해요',
    color: Colors.pink,
  ),
  QuestionVo(
    question: '여행 목록',
    answer: '캠핑과 해외여행을 좋아해요 여기를 클릭하면 여행 목록을 볼 수 있어요',
    color: Colors.teal,
    childScreen: TravelScreen(),
  ),
  QuestionVo(
    question: '베이킹',
    answer: '베이킹 하는걸 좋아해요 여기를 클릭하면 만들었던 베이킹 레시피를 볼 수 있어요',
    color: Colors.brown,
    childScreen: BakingScreen(),
  ),
];
