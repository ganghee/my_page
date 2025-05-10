class TravelVo {
  int travelId;
  String title;
  String titleEnglish;
  String imageUrl;
  String patternImage;

  TravelVo({
    required this.travelId,
    required this.title,
    required this.titleEnglish,
    required this.imageUrl,
    required this.patternImage,
  });
}

final List<TravelVo> myTravel = [
  TravelVo(
    travelId: 1,
    title: '방콕',
    titleEnglish: 'Bangkok',
    imageUrl: 'assets/images/bangkok/bangkok.webp',
    patternImage: 'assets/images/bangkok/bangkok_pattern.webp',
  ),
  TravelVo(
    travelId: 2,
    title: '오사카',
    titleEnglish: 'Osaka',
    imageUrl: 'assets/images/osaka/osaka.webp',
    patternImage: 'assets/images/osaka/osaka_pattern.webp',
  ),
  TravelVo(
    travelId: 3,
    title: '제주도',
    titleEnglish: 'Jeju',
    imageUrl: 'assets/images/jeju/jeju.webp',
    patternImage: 'assets/images/jeju/jeju_pattern.webp',
  ),
  TravelVo(
    travelId: 4,
    title: '강릉',
    titleEnglish: 'Gangneung',
    imageUrl: 'assets/images/gangneung/gangneung.webp',
    patternImage: 'assets/images/gangneung/gangneung_pattern.webp',
  ),
];
