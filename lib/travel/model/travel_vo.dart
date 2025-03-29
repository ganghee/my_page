class TravelVo {
  int travelId;
  String title;
  String imageUrl;
  String description;

  TravelVo({
    required this.travelId,
    required this.title,
    required this.imageUrl,
    required this.description,
  });
}

final List<TravelVo> myTravel = [
  TravelVo(
    travelId: 1,
    title: '방콕',
    imageUrl: 'assets/images/bangkok.png',
    description: '',
  ),
  TravelVo(
    travelId: 2,
    title: '오사카',
    imageUrl: 'assets/images/osaka.jpg',
    description: '',
  ),
  TravelVo(
    travelId: 3,
    title: '제주도',
    imageUrl: 'assets/images/jeju.jpeg',
    description: '',
  ),
  TravelVo(
    travelId: 4,
    title: '강릉',
    imageUrl: 'assets/images/gangneung.jpg',
    description: '',
  ),
  TravelVo(
    travelId: 5,
    title: '포천',
    imageUrl: 'assets/images/pocheon.jpeg',
    description: '',
  ),
];
