import 'package:flutter/material.dart';

class BakingVo {
  final String name;
  final String imageUrl;
  final String ingredients;
  final List<String> recipe;
  final Color color;

  BakingVo({
    required this.name,
    required this.imageUrl,
    required this.ingredients,
    required this.recipe,
    required this.color,
  });
}

List<BakingVo> bakings = [
  BakingVo(
    name: '크로와상',
    imageUrl:
        'https://pngimg.com/uploads/croissant/croissant_PNG46660.png',
    ingredients:
        '이스트 5g, 소금 5g, 설탕 20g, 계란 10g, 버터 20g, 강력분 250g, 버터 120g, 물 120g',
    recipe: [
      '충전용버터는 지퍼백에 넣어 네모로 성형해서 냉장고에 넣어주세요!! 밀대로하면 편해요!',
      '강력분에 구멍3개를 파서 이스트,설탕,소금을 넣어줍니다',
      '밀가루로 코팅하듯이 각각섞습니다',
      '물을 넣습니다 이때 손반죽하지 마시고 주걱으로 대충섞습니다',
      '손반죽 합니다 물이 부족해 보이지만 버터를 넣을꺼라 물을 더추가하지 않습니다',
      '매끈한 반죽이 나오면 돼요',
      '따뜻한곳에서 1시간 발효시킵니다.',
      '반죽 한 후 12시간 냉장고에 넣어주세요',
      '납작하게 반죽을 펴서 버터를 넣고 접어주세요',
      '냉장고에 20분 보관',
      '이 과정을 3번 반복',
      '반죽을 삼각형 모양으로 자르고 말아서 따뜻한 곳에서 30분 발효',
      '발효된 반죽에 계란을 바르고 200도로 13분간 굽기',
    ],
    color: Colors.yellow,
  ),
  BakingVo(
    name: '식빵',
    imageUrl:
        'https://purepng.com/public/uploads/large/purepng.com-sliced-breadfood-bread-941524637257xz7f4.png',
    ingredients:
        '우유 140g, 계란 35g, 설탕 35g, 소금 6g, 드라이 이스트 4g, 강력분 240g, 무염 버터 32g',
    recipe: [],
    color: Colors.blue,
  ),
  BakingVo(
    name: '모닝빵',
    imageUrl:
        'https://static.vecteezy.com/system/resources/thumbnails/049/111/541/small_2x/freshly-baked-dinner-rolls-arranged-on-a-plate-cut-out-stock-png.png',
    ingredients:
        '우유 160g, 계란 하나, 설탕 40g, 소금 5g, 드라이 이스트 5g, 강력분 310g, 무염 버터 35g',
    recipe: [],
    color: Colors.green,
  ),
  BakingVo(
    name: '스콘',
    imageUrl:
        'https://orchardleafoods.co.uk/wp-content/uploads/2023/02/Scone_City.png',
    ingredients: '박력분 200g, 베이킹파우더 5g, 소금 2g, 설탕 35g, 무염 버터 80g, 우유 25g, 계란 1개',
    recipe: [],
    color: Colors.pinkAccent,
  ),
  BakingVo(
    name: '쿠키',
    imageUrl:
        'https://static.vecteezy.com/system/resources/thumbnails/044/308/311/small_2x/chocolate-chip-cookies-with-transparent-background-png.png',
    ingredients:
        '차가운 무염 버터 94g, 설탕 114g, 중력분 155g, 베이킹 파우더 2g, 소금 1g, 계란 1개, 베이킹소다 2g, 전처리한 호두 150g, 다진 초콜릿 168g',
    recipe: [],
    color: Colors.white,
  ),
  BakingVo(
    name: '치즈 케이크',
    imageUrl:
        'https://images.squarespace-cdn.com/content/v1/538500e4e4b0fa9e95efc7b9/1627656601170-ZPCM9P1F97Y0XZU1FVEB/New+York+Baby+CC+slice+isolated.png?format=1000w',
    ingredients: '크림 치즈 350g, 설탕 80g, 계란 85g, 생크림 110g',
    recipe: [],
    color: Colors.greenAccent,
  ),
  BakingVo(
    name: '두바이 초콜릿',
    imageUrl:
        'https://www.mochidoh.ca/cdn/shop/files/dubai_bar_no_background.png?v=1739144773',
    ingredients: '카다이프 200g, 버터 110g, 피스타치오 페이스트 500g, 커버춰 400g',
    recipe: [],
    color: Colors.white30,
  ),
];
