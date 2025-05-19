import 'package:flutter/material.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:my/baking/baking_binding.dart';
import 'package:my/baking/baking_screen.dart';
import 'package:my/baking/baking_vo.dart';
import 'package:my/book/book_binding.dart';
import 'package:my/book/book_screen.dart';
import 'package:my/travel/travel_binding.dart';
import 'package:my/util/image_view.dart';

import '../travel/travel_screen.dart';

class QuestionVo {
  String question;
  String questionEnglish;
  String answer;
  String answerEnglish;
  Color color;
  String? path;
  Widget? answerScreen;
  Widget? transitionScreen;
  Bindings? binding;

  QuestionVo({
    required this.question,
    required this.questionEnglish,
    required this.answer,
    required this.answerEnglish,
    required this.color,
    this.path,
    this.answerScreen,
    this.transitionScreen,
    this.binding,
  });
}

final List<QuestionVo> myQuestion = [
  QuestionVo(
    question: '좋아하는 음식',
    questionEnglish: 'Favorite food',
    answer: '햄버거를 가장 좋아해요.\n특히 소고기 패티가 들어간 버거킹의 와퍼와 파이브 가이즈를 좋아해요',
    answerEnglish:
        'I like hamburgers the most. I especially like the Whopper from Burger King, which has a beef patty.',
    color: Colors.red,
  ),
  QuestionVo(
    question: '추천하는 책',
    questionEnglish: 'Recommended book',
    answer:
        '구의 증명을 추천해요.\n고아원 출신의 주인공의 우울하고 어두운 과거를 다루고 있어요.\n주인공은 자신의 과거를 극복하고 새로운 삶을 시작하는 과정을 그려내고 있어요.\n'
        '감동적이고 깊이 있는 이야기를 원하신다면 이 책을 추천해요.',
    answerEnglish: 'I recommend the Gu\'s proof.',
    color: Colors.blue,
  ),
  QuestionVo(
    question: '요즘 운동하는 것',
    questionEnglish: 'Exercise these days',
    answer:
        '달리기를 해요.\n일주일에 세 번 10km씩 뛰어요.\n마라톤 대회에도 참여해서 2025년 3월에 풀코스를 3시간 47분동안 뛰었어요. 10km 기록은 44분 40초예요',
    answerEnglish:
        'I run. I run 10km three times a week. I also participated in a marathon and ran the full course in 3 hours and 47 minutes in March 2025.',
    color: Colors.green,
  ),
  QuestionVo(
    question: '좋아하는 영화 장르',
    questionEnglish: 'Favorite movie genre',
    answer: '로맨틱 판타지 장르의 영화를 좋아해요',
    answerEnglish: 'I like romantic fantasy movies',
    color: Colors.yellow,
  ),
  QuestionVo(
    question: '자주가는 빵집',
    questionEnglish: 'Favorite bakery',
    answer: '성수동의 베이킹 스튜디오를 자주가요 특히 치아바타를 좋아해요',
    answerEnglish:
        'I often go to the baking studio in Seongsu-dong, especially I like ciabatta',
    color: Colors.purple,
  ),
  QuestionVo(
    question: '읽은 도서',
    questionEnglish: 'Books I read',
    answer: '한 달에 한 권은 읽는 것 같아요.\n여기를 클릭하면 읽은 도서 목록을 볼 수 있어요',
    answerEnglish:
        'I think I read one book a month. If you click here, you can see the list of books I read',
    color: Colors.orange,
    path: '/book',
    answerScreen: BookScreen(),
    transitionScreen: ImageView(
      imageUrl: 'assets/images/book/book.webp',
      fit: BoxFit.cover,
      repeat: true,
      colorBlendMode: BlendMode.darken,
      color: Colors.black.withAlpha(180),
    ),
    binding: BookBinding(),
  ),
  QuestionVo(
    question: '좋아하는 음악 장르',
    questionEnglish: 'Favorite music genre',
    answer: '잔잔하고 조용한 음악을 좋아해요.\n특히 지브리 음악을 좋아해요',
    answerEnglish: 'I like Ghibli music',
    color: Colors.pink,
  ),
  QuestionVo(
    question: '여행 목록',
    questionEnglish: 'Travel list',
    answer: '캠핑과 해외여행을 좋아해요.\n여기를 클릭하면 여행 목록을 볼 수 있어요',
    answerEnglish:
        'I like camping and overseas travel. If you click here, you can see the travel list',
    color: Colors.teal,
    path: '/travel',
    answerScreen: TravelScreen(),
    transitionScreen: ImageView(
      imageUrl: 'assets/images/bangkok/bangkok.webp',
      colorBlendMode: BlendMode.darken,
      color: Colors.black.withAlpha(180),
      fit: BoxFit.cover,
    ),
    binding: TravelBinding(),
  ),
  QuestionVo(
    question: '베이킹',
    questionEnglish: 'Baking',
    answer: '베이킹 하는걸 좋아해요\n여기를 클릭하면 만들었던 베이킹 레시피를 볼 수 있어요',
    answerEnglish:
        'I like baking. If you click here, you can see the baking recipes I made',
    color: Colors.brown,
    path: '/baking',
    answerScreen: BakingScreen(),
    transitionScreen: ColoredBox(color: bakings.first.color),
    binding: BakingBinding(),
  ),
  QuestionVo(
    question: '좋아하는 프로그램',
    questionEnglish: 'Favorite content on Netflix',
    answer: '나는 솔로를 보고 있어요. 25기 때 재밌게봐서 그 때 이후로 계속 보고 있어요.',
    answerEnglish:
        'I am watching "I am Solo". I watched it at 25th episode, and I have been watching it since then.',
    color: Colors.grey,
  ),
  QuestionVo(
    question: '스트레스 푸는 방법',
    questionEnglish: 'How to relieve stress',
    answer: '운동을 해요. 요즘에는 수영을 하고 있어요.\n레일을 한 바퀴 돌고 나면 기분이 좋아져요',
    answerEnglish:
        'I exercise. These days, I swim. I feel good after swimming a lap.',
    color: Colors.amber,
  ),
  QuestionVo(
    question: '인생 좌우명',
    questionEnglish: 'Motto',
    answer: '나에게는 엄격하게 살고 남에게는 관대하게 살자',
    answerEnglish: ' Live strictly for myself and generously for others',
    color: Colors.tealAccent,
  ),
  QuestionVo(
    question: '좋아하는 과일',
    questionEnglish: 'Favorite fruit',
    answer: '딸기를 가장 좋아해요.\n생딸기 뿐만 아니라 딸리 라떼나 딸기 스무디, 딸기 케이크등 딸기를 활용한 음식을 좋아해요',
    answerEnglish:
        'I like strawberries the most. I like not only fresh strawberries but also strawberry lattes, strawberry smoothies, and strawberry cakes.',
    color: Colors.pinkAccent,
  ),
  QuestionVo(
    question: '가장 가고 싶은 여행지',
    questionEnglish: 'Most wanted travel destination',
    answer: '호주에 가보고 싶어요. 그레이트 베이러 리프에서 형형색색의 산호랑 열대어를 보면서 스노쿨링을 해보고 싶어요.',
    answerEnglish:
        'I want to go to Australia. I want to go snorkeling while watching colorful corals and tropical fish at the Great Barrier Reef.',
    color: Colors.deepPurple,
  ),
  QuestionVo(
    question: '좋아하는 커피',
    questionEnglish: 'Favorite coffee',
    answer:
        '가장 좋아하는 커피는 베트남의 족제비 커피예요.\n초콜릿 향의 커피가 정말 맛있어요. 하지만 가격이 비싸고 구하기 힘들어요.\n'
        '그래서 자주 마시는 커피는 콜드브루예요. 스타벅스의 콜드브루를 좋아해요.',
    answerEnglish:
        'My favorite coffee is civet coffee from Vietnam. The chocolate-scented coffee is really delicious. But it\'s expensive and hard to find.\n'
        'So the coffee I drink often is cold brew. I like Starbucks cold brew.',
    color: Colors.deepOrange,
  ),
  QuestionVo(
    question: '키우는 식물',
    questionEnglish: 'Plants I grow',
    answer: '바질과 화이트 스노우, 인도고무나무, 몬스테라, 레몬을 키우고 있어요.',
    answerEnglish:
        'I grow basil, white snow, Indian rubber tree, monstera, and lemon.',
    color: Colors.lightBlue,
  ),
  QuestionVo(
    question: '인생에서 가장 기억에 남는 경험',
    questionEnglish: 'Most memorable experience in life',
    answer: '군대에서 경험은 제 인생에서 가장 큰 영향을 끼쳤어요.\n'
        '정말 다양한 사람들을 만났고 그들과 함께 생활 하면서 많은 것을 배웠어요.\n'
        '협동심과 이해심을 배우며 훈련병부터 병장이 되기까지 내가 성장하고 변화한다는 걸 느꼈어요.\n',
    answerEnglish:
        'The experience in the military had the biggest impact on my life.\n'
        'I met really various people and learned a lot while living with them.\n'
        'I learned cooperation and understanding, and I felt that I was growing and changing from a recruit to a sergeant.\n'
        'I think this experience will be a great asset in my life.',
    color: Colors.lightGreen,
  ),
  QuestionVo(
    question: '무인도에 혼자 간다면 가져갈 세 가지는?',
    questionEnglish:
        'Three things you must take with you if you go to a deserted island alone',
    answer: '높은 자존감과 긍정적인 마음, 지혜\n'
        '이 세가지만 있다면 무인도에서 어떻게든 살아남을 것 같아요. 혼자라도 긍정적인 마음으로 하루하루 살아가다 보면 오래 건강하게 지낼 수 있을 것 같아요.\n',
    answerEnglish:
        'If I had to go to a deserted island alone, I would take high self-esteem, a positive mind and wisdom.\n'
        'If I have these three things, I think I can survive on a deserted island somehow. Even if I am alone, I think I can live a long and healthy life with a positive mind day by day.\n',
    color: Colors.orangeAccent,
  ),
  QuestionVo(
    question: '어렸을 때 꿈',
    questionEnglish: 'Childhood dream',
    answer: '어렸을 때는 비행기 정비사나 조종사가 되고 싶었어요.\n'
        '어렸을 때 집 근처에 공군이 있어서 비행기를 자주 볼 수 있었어요. 비행기를 볼 때 마다 큰 기계가 하늘을 날라 다니는 게 신기해 보이고 멋있어 보였어요.\n',
    answerEnglish:
        'When I was young, I wanted to be an airplane mechanic or pilot.\n'
        'There was an air force base near my house when I was a child, so I could see airplanes often. Every time I saw an airplane, it looked amazing and cool to see a big machine flying in the sky.\n',
    color: Colors.brown,
  ),
  QuestionVo(
    question: '나에게 성공이란',
    questionEnglish: 'Success to me',
    answer: '나에게 성공이란 도덕적으로 성숙하고 내 주변 사람들에게 많은 도움과 영향을 줄 수 있는 상태라고 생각해요.\n',
    answerEnglish:
        'To me, success is a state of being morally mature and able to help and influence those around me.\n',
    color: Colors.black38,
  ),
  QuestionVo(
    question: '해보고 싶은 운동',
    questionEnglish: 'Exercise I want to try',
    answer:
        '스쿠버 다이빙을 해보고 싶어요.\n자격증도 따고, 유명한 여행지의 바닷가에 놀러가서 스쿠버 다이빙을 해보면 좋은 경험이 될 것 같아요.\n',
    answerEnglish:
        'I want to try scuba diving. I think it would be a good experience to get a license and go to the beach of a famous tourist destination and go scuba diving.\n',
    color: Colors.yellow,
  ),
  QuestionVo(
    question: '배우고 싶은 기술',
    questionEnglish: 'Field I want to study or learn',
    answer: '인공지능에 대해 공부해보고 싶어요.\n인공지능을 통해 사람들에게 더욱 가치 있는 정보를 보여주고 싶어요.\n',
    answerEnglish:
        ' I want to study artificial intelligence. I want to show people more valuable information through artificial intelligence.\n',
    color: Colors.brown,
  ),
  QuestionVo(
    question: '경제적 자유를 얻는다면',
    questionEnglish: 'If I gain financial freedom',
    answer: '테라스가 넓은 집을 사고 싶어요.\n테라스에서 바베큐를 하거나 식물을 키우면서 여유롭게 지내고 싶어요.\n',
    answerEnglish:
        'I want to buy a house with a large terrace. I want to live leisurely while having a barbecue or growing plants on the terrace.\n',
    color: Colors.indigo,
  ),
];
