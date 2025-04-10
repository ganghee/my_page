import 'package:flutter/material.dart';

class BakingVo {
  final String name;
  final String nameEnglish;
  final String imageUrl;
  final String ingredients;
  final String ingredientsEnglish;
  final List<String> recipe;
  final List<String> recipeEnglish;
  final Color color;

  BakingVo({
    required this.name,
    required this.nameEnglish,
    required this.imageUrl,
    required this.ingredients,
    required this.ingredientsEnglish,
    required this.recipe,
    required this.recipeEnglish,
    required this.color,
  });
}

List<BakingVo> bakings = [
  BakingVo(
    name: '크로와상',
    nameEnglish: 'Croissant',
    imageUrl: 'assets/images/baking/croissant.webp',
    ingredients:
        '이스트 5g, 소금 5g, 설탕 20g, 계란 10g, 버터 20g, 강력분 250g, 버터 120g, 물 120g',
    ingredientsEnglish:
        'Yeast 5g, Salt 5g, Sugar 20g, Egg 10g, Butter 20g, Strong flour 250g, Butter 120g, Water 120g',
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
    recipeEnglish: [
      'Put the butter in a zip bag and shape it into a square, then put it in the refrigerator!! It\'s easier with a rolling pin!',
      'Make 3 holes in the strong flour and put yeast, sugar, and salt in them',
      'Mix each like coating flour',
      'Add water. At this time, do not knead by hand, but mix roughly with a spatula',
      'Knead by hand. It looks like there is not enough water, but we will add more water later',
      'A smooth dough comes out',
      'Ferment for 1 hour in a warm place.',
      'After kneading, put it in the refrigerator for 12 hours',
      'Flatten the dough and put in the butter and fold it',
      'Store in the refrigerator for 20 minutes',
      'Repeat this process 3 times',
      'Cut the dough into triangles and roll it up and ferment it in a warm place for 30 minutes',
      'Brush the fermented dough with egg and bake at 200 degrees for 13 minutes',
    ],
    color: Colors.orange.shade50,
  ),
  BakingVo(
    name: '식빵',
    nameEnglish: 'White bread',
    imageUrl: 'assets/images/baking/white_bread.webp',
    ingredients:
        '우유 140g, 계란 35g, 설탕 35g, 소금 6g, 드라이 이스트 4g, 강력분 240g, 무염 버터 32g',
    ingredientsEnglish:
        'Milk 140g, Egg 35g, Sugar 35g, Salt 6g, Dry yeast 4g, Strong flour 240g, Unsalted butter 32g',
    recipe: [
      '제빵기에 따뜻하게 데운 물, 우유, 설탕, 소금을 넣고 강력분, 이스트, 버터를 넣어 제빵기 반죽 코스로 돌려 반죽하고 볼에 반죽을 담아 따뜻한 물을 컵에 담고 뚜껑을 닫아 1차 발효해요.',
      '한 시간 정도 발효했어요. 3배쯤 부풀고 손가락으로 꾹 눌러 모양이 유지되면 발효가 된 거랍니다.',
      '1차 발효가 끝난 반죽은 가스 빼기를 하고 둥글리기 후 10~15분간 중간 발효합니다.',
      '중간 발효 후 다시 가스를 빼고 삼절 접기 후 팬에 담아요.',
      '팬에 담은 식빵은 2차 발효를 해요. 30분 정도 발효 후 계란을 풀어 바르고 170도로 예열한 오븐에 넣어 20분간 구워요',
    ],
    recipeEnglish: [
      'Put warm water, milk, sugar, and salt in the bread maker, add strong flour, yeast, and butter, and run the bread maker on the kneading course to knead the dough. Put the dough in a bowl, put warm water in a cup, close the lid, and ferment for the first time.',
      'It has been fermented for about an hour. If it swells about 3 times and you press it with your finger and the shape is maintained, it is fermented.',
      'After the first fermentation is over, remove the gas and round it up and ferment it for 10-15 minutes.',
      'After intermediate fermentation, remove the gas again and fold it three times and put it in a pan.',
      'Ferment the bread in the pan for the second time. After fermenting for about 30 minutes, beat an egg and apply it, then put it in a preheated oven at 170 degrees and bake for 20 minutes',
    ],
    color: Colors.blue.shade50,
  ),
  BakingVo(
    name: '모닝빵',
    nameEnglish: 'Morning bread',
    imageUrl: 'assets/images/baking/morning_bread.webp',
    ingredients:
        '우유 160g, 계란 하나, 설탕 40g, 소금 5g, 드라이 이스트 5g, 강력분 310g, 무염 버터 35g',
    ingredientsEnglish:
        'Milk 160g, One egg, Sugar 40g, Salt 5g, Dry yeast 5g, Strong flour 310g, Unsalted butter 35g',
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
    recipeEnglish: [
      'Mix milk and instant dry yeast and let it sit for 5 minutes',
      'Add sugar, salt, egg, and strong flour and mix well',
      'When the dough becomes one lump, place it on the work surface and knead for 10 minutes',
      'Add butter and knead for another 10-15 minutes',
      'Cover with plastic wrap or a damp cloth and let it sit until the dough doubles in size',
      'Divide the dough into 12 pieces and round them up',
      'Cover the rounded dough with plastic wrap and let it sit for 10 minutes',
      'Bake at 170°C for 8-10 minutes',
    ],
    color: Colors.green.shade50,
  ),
  BakingVo(
    name: '스콘',
    nameEnglish: 'Scone',
    imageUrl: 'assets/images/baking/scone.webp',
    ingredients: '박력분 200g, 베이킹파우더 5g, 소금 2g, 설탕 35g, 무염 버터 80g, 우유 25g, 계란 1개',
    ingredientsEnglish:
        'Weak flour 200g, Baking powder 5g, Salt 2g, Sugar 35g, Unsalted butter 80g, Milk 25g, One egg',
    recipe: [
      '박력분을 체에 쳐서 준비합니다',
      '박력분, 베이킹파우더, 소금, 설탕을 섞어주세요',
      '버터를 작은 크기로 썰어 밀가루에 넣고 섞어주세요',
      '우유와 계란을 섞어주세요',
      '랩에 싸서 냉장고에 30분 정도 둡니다',
      '냉장고에 휴지시킨 반죽을 꺼내 오븐 틀에 적당한 크기로 떼어내어 올림니다',
      '180도로 예열된 오븐에서 17분 정도 구워주세요',
    ],
    recipeEnglish: [
      'Sift the weak flour to prepare',
      'Mix weak flour, baking powder, salt, and sugar',
      'Cut the butter into small pieces and add it to the flour and mix',
      'Mix milk and egg',
      'Wrap in plastic wrap and refrigerate for about 30 minutes',
      'Take out the rested dough from the refrigerator and place it in a suitable size on the oven mold',
      'Bake in a preheated oven at 180 degrees for about 17 minutes',
    ],
    color: Colors.grey.shade200,
  ),
  BakingVo(
    name: '쿠키',
    nameEnglish: 'Cookie',
    imageUrl: 'assets/images/baking/cookie.webp',
    ingredients:
        '차가운 무염 버터 94g, 설탕 114g, 중력분 155g, 베이킹 파우더 2g, 소금 1g, 계란 1개, 베이킹소다 2g, 전처리한 호두 150g, 다진 초콜릿 168g',
    ingredientsEnglish:
        'Cold unsalted butter 94g, Sugar 114g, All-purpose flour 155g, Baking powder 2g, Salt 1g, One egg, Baking soda 2g, Pre-treated walnuts 150g, Chopped chocolate 168g',
    recipe: [
      '중력분을 체에 쳐서 준비합니다',
      '소금과 베이킹 파우터, 설탕, 베이킹 소다를 섞어주세요',
      '거품기로 버터를 크림화 한 뒤 실온에 두었던 달걀과 섞어주세요',
      '섞어둔 가루를 넣고 주걱으로 섞어주세요',
      '호두와 초콜릿을 넣고 섞어주세요',
      '반죽을 모양에 맞게 만들어서 170도로 예열된 오븐에서 15분간 구워주세요',
    ],
    recipeEnglish: [
      'Sift the all-purpose flour to prepare',
      'Mix salt, baking powder, sugar, and baking soda',
      'Cream the butter with a whisk and mix it with the egg that has been at room temperature',
      'Add the mixed powder and mix with a spatula',
      'Add walnuts and chocolate and mix',
      'Shape the dough and bake in a preheated oven at 170 degrees for 15 minutes',
    ],
    color: Colors.brown.shade200,
  ),
  BakingVo(
    name: '치즈 케이크',
    nameEnglish: 'Cheesecake',
    imageUrl: 'assets/images/baking/cake.webp',
    ingredients: '크림 치즈 350g, 설탕 80g, 계란 85g, 생크림 110g',
    ingredientsEnglish:
        'Cream cheese 350g, Sugar 80g, Egg 85g, Fresh cream 110g',
    recipe: [
      '크림치즈를 부드럽게 만들어주세요',
      '설탕을 넣고 섞어주세요',
      '계란과 생크림을 넣고 섞어주세요',
      '180도로 예열된 오븐에서 40분간 구워주다가 150도로 낮춰서 20분간 더 구워주세요',
    ],
    recipeEnglish: [
      'Make the cream cheese soft',
      'Add sugar and mix',
      'Add egg and fresh cream and mix',
      'Bake in a preheated oven at 180 degrees for 40 minutes, then lower to 150 degrees and bake for another 20 minutes',
    ],
    color: Colors.yellow.shade50,
  ),
  BakingVo(
    name: '두바이 초콜릿',
    nameEnglish: 'Dubai chocolate',
    imageUrl: 'assets/images/baking/chocolate.webp',
    ingredients: '카다이프 200g, 버터 110g, 피스타치오 페이스트 500g, 커버춰 400g',
    ingredientsEnglish:
        'Kadaif 200g, Butter 110g, Pistachio paste 500g, Couverture 400g',
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
    recipeEnglish: [
      'Put the couverture in a bowl of hot water and melt it',
      'Pour the couverture into a chocolate mold and put it in the freezer',
      'Chop the kadaif finely',
      'Roast the kadaif',
      'Melt the butter',
      'Mix butter, pistachio paste, and kadaif',
      'Pour into chocolate mold',
      'Pour chocolate over kadaif',
      'Put in the freezer for 10 minutes',
    ],
    color: Colors.green.shade50,
  ),
];
