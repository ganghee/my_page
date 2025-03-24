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
    color: Colors.orange.shade50,
  ),
  BakingVo(
    name: '식빵',
    imageUrl:
        'https://purepng.com/public/uploads/large/purepng.com-sliced-breadfood-bread-941524637257xz7f4.png',
    ingredients:
        '우유 140g, 계란 35g, 설탕 35g, 소금 6g, 드라이 이스트 4g, 강력분 240g, 무염 버터 32g',
    recipe: [
      '제빵기에 따뜻하게 데운 물, 우유, 설탕, 소금을 넣고 강력분, 이스트, 버터를 넣어 제빵기 반죽 코스로 돌려 반죽하고 볼에 반죽을 담아 따뜻한 물을 컵에 담고 뚜껑을 닫아 1차 발효해요.',
      '한 시간 정도 발효했어요. 3배쯤 부풀고 손가락으로 꾹 눌러 모양이 유지되면 발효가 된 거랍니다.',
      '1차 발효가 끝난 반죽은 가스 빼기를 하고 둥글리기 후 10~15분간 중간 발효합니다.',
      '중간 발효 후 다시 가스를 빼고 삼절 접기 후 팬에 담아요.',
      '팬에 담은 식빵은 2차 발효를 해요. 30분 정도 발효 후 계란을 풀어 바르고 170도로 예열한 오븐에 넣어 20분간 구워요',
    ],
    color: Colors.blue.shade50,
  ),
  BakingVo(
    name: '모닝빵',
    imageUrl:
        'https://static.vecteezy.com/system/resources/thumbnails/049/111/541/small_2x/freshly-baked-dinner-rolls-arranged-on-a-plate-cut-out-stock-png.png',
    ingredients:
        '우유 160g, 계란 하나, 설탕 40g, 소금 5g, 드라이 이스트 5g, 강력분 310g, 무염 버터 35g',
    recipe: [
      '우유와 인스턴트 드라이 이스트를 섞고, 5분 간 그대로 두세요',
      '설탕, 소금, 달걀, 강력분을 넣고 잘 섞어 주세요',
      '반죽이 한 덩이가 되면 작업대 위에 놓고 10분 간 치대어 주세요',
      '버터를 넣고 10-15분 간 더 치대어 주세요',
      '랩이나 젖은 천을 씌워 반죽의 크기가 2배가 될 때까지 두세요',
      '반죽을 12개로 분할한 후, 둥글리기 해주세요',
      '둥글리기 한 반죽을 랩을 씌워 10분 간 두세요',
      '170°C에서 8-10분 간 구워 주세요',
    ],
    color: Colors.green.shade50,
  ),
  BakingVo(
    name: '스콘',
    imageUrl:
        'https://orchardleafoods.co.uk/wp-content/uploads/2023/02/Scone_City.png',
    ingredients: '박력분 200g, 베이킹파우더 5g, 소금 2g, 설탕 35g, 무염 버터 80g, 우유 25g, 계란 1개',
    recipe: [
      '박력분을 체에 쳐서 준비합니다',
      '박력분, 베이킹파우더, 소금, 설탕을 섞어주세요',
      '버터를 작은 크기로 썰어 밀가루에 넣고 섞어주세요',
      '우유와 계란을 섞어주세요',
      '랩에 싸서 냉장고에 30분 정도 둡니다',
      '냉장고에 휴지시킨 반죽을 꺼내 오븐 틀에 적당한 크기로 떼어내어 올림니다',
      '180도로 예열된 오븐에서 17분 정도 구워주세요',
    ],
    color: Colors.grey.shade200,
  ),
  BakingVo(
    name: '쿠키',
    imageUrl:
        'https://static.vecteezy.com/system/resources/thumbnails/044/308/311/small_2x/chocolate-chip-cookies-with-transparent-background-png.png',
    ingredients:
        '차가운 무염 버터 94g, 설탕 114g, 중력분 155g, 베이킹 파우더 2g, 소금 1g, 계란 1개, 베이킹소다 2g, 전처리한 호두 150g, 다진 초콜릿 168g',
    recipe: [
      '중력분을 체에 쳐서 준비합니다',
      '소금과 베이킹 파우터, 설탕, 베이킹 소다를 섞어주세요',
      '거품기로 버터를 크림화 한 뒤 실온에 두었던 달걀과 섞어주세요',
      '섞어둔 가루를 넣고 주걱으로 섞어주세요',
      '호두와 초콜릿을 넣고 섞어주세요',
      '반죽을 모양에 맞게 만들어서 170도로 예열된 오븐에서 15분간 구워주세요',
    ],
    color: Colors.brown.shade200,
  ),
  BakingVo(
    name: '치즈 케이크',
    imageUrl:
        'https://images.squarespace-cdn.com/content/v1/538500e4e4b0fa9e95efc7b9/1627656601170-ZPCM9P1F97Y0XZU1FVEB/New+York+Baby+CC+slice+isolated.png?format=1000w',
    ingredients: '크림 치즈 350g, 설탕 80g, 계란 85g, 생크림 110g',
    recipe: [
      '크림치즈를 부드럽게 만들어주세요',
      '설탕을 넣고 섞어주세요',
      '계란과 생크림을 넣고 섞어주세요',
      '180도로 예열된 오븐에서 40분간 구워주다가 150도로 낮춰서 20분간 더 구워주세요',
    ],
    color: Colors.yellow.shade50
    ,
  ),
  BakingVo(
    name: '두바이 초콜릿',
    imageUrl:
        'https://www.mochidoh.ca/cdn/shop/files/dubai_bar_no_background.png?v=1739144773',
    ingredients: '카다이프 200g, 버터 110g, 피스타치오 페이스트 500g, 커버춰 400g',
    recipe: [
      '뜨거운 물에 담은 볼에 커버춰를 넣고 녹여주세요',
      '초콜릿 몰드에 커버춰를 부어 냉동실에 넣어주세요',
      '카다이프를 잘게 다져주세요',
      '카다이프를 볶아주세요',
      '버터를 녹여주세요',
      '버터와 피스타치오 페이스트, 카다이프를 섞어주세요',
      '초콜릿 몰드에 부어주세요',
      '초콜릿을 카다이프 위에 부워주세요',
      '냉동실에 10분 넣어주세요',
    ],
    color: Colors.green.shade50,
  ),
];
