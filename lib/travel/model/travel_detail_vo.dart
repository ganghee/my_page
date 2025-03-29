part 'bangkok_vo.dart';

part 'gangneung_vo.dart';

part 'jeju_vo.dart';

part 'osaka_vo.dart';

part 'pocheon_vo.dart';

enum TravelDetailType {
  text,
  image,
}

class TravelDetailVo {
  int travelId;
  List<TravelItemVo> items;

  TravelDetailVo({
    required this.travelId,
    required this.items,
  });
}

class TravelItemVo {
  TravelDetailType type;
  String description;
  List<String>? imageUrls;

  TravelItemVo({
    required this.type,
    required this.description,
    this.imageUrls,
  });
}

final List<TravelDetailVo> myTravelDetail = [
  _bangkokVo,
  _osakaVo,
  _jejuVo,
  _gangneungVo,
  _pocheonVo,
];
