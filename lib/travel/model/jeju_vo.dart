part of 'travel_detail_vo.dart';

final TravelDetailVo _jejuVo = TravelDetailVo(
  travelId: 3,
  items: [
    TravelItemVo(type: TravelDetailType.text, description: '제주도 여행'),
    TravelItemVo(
      type: TravelDetailType.image,
      description:
          'https://cdn.pixabay.com/photo/2016/11/29/09/08/jeju-1867280_1280.jpg',
    ),
    TravelItemVo(type: TravelDetailType.text, description: '제주도 여행2'),
    TravelItemVo(
      type: TravelDetailType.image,
      description:
          'https://cdn.pixabay.com/photo/2016/11/29/09/08/jeju-1867280_1280.jpg',
    ),
  ],
);