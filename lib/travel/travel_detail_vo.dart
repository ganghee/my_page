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

  TravelItemVo({
    required this.type,
    required this.description,
  });
}

final List<TravelDetailVo> myTravelDetail = [
  TravelDetailVo(
    travelId: 1,
    items: [
      TravelItemVo(type: TravelDetailType.text, description: '방콕 여행'),
      TravelItemVo(
        type: TravelDetailType.image,
        description:
            'https://blog-static.kkday.com/ko/blog/wp-content/uploads/%EB%B0%A9%EC%BD%95-%EC%99%95%EA%B6%81-%EC%A0%84%EA%B2%BD.jpg',
      ),
      TravelItemVo(type: TravelDetailType.text, description: '방콕 여행2'),
      TravelItemVo(
        type: TravelDetailType.image,
        description:
            'https://blog-static.kkday.com/ko/blog/wp-content/uploads/%EB%B0%A9%EC%BD%95-%EC%99%95%EA%B6%81-%EC%A0%84%EA%B2%BD.jpg',
      ),
      TravelItemVo(type: TravelDetailType.text, description: '방콕 여행3'),
      TravelItemVo(
        type: TravelDetailType.image,
        description:
        'https://blog-static.kkday.com/ko/blog/wp-content/uploads/%EB%B0%A9%EC%BD%95-%EC%99%95%EA%B6%81-%EC%A0%84%EA%B2%BD.jpg',
      ),
      TravelItemVo(type: TravelDetailType.text, description: '방콕 여행2'),
      TravelItemVo(
        type: TravelDetailType.image,
        description:
        'https://blog-static.kkday.com/ko/blog/wp-content/uploads/%EB%B0%A9%EC%BD%95-%EC%99%95%EA%B6%81-%EC%A0%84%EA%B2%BD.jpg',
      ),
      TravelItemVo(type: TravelDetailType.text, description: '방콕 여행5'),
      TravelItemVo(
        type: TravelDetailType.image,
        description:
        'https://blog-static.kkday.com/ko/blog/wp-content/uploads/%EB%B0%A9%EC%BD%95-%EC%99%95%EA%B6%81-%EC%A0%84%EA%B2%BD.jpg',
      ),
      TravelItemVo(type: TravelDetailType.text, description: '방콕 여행2'),
      TravelItemVo(
        type: TravelDetailType.image,
        description:
        'https://blog-static.kkday.com/ko/blog/wp-content/uploads/%EB%B0%A9%EC%BD%95-%EC%99%95%EA%B6%81-%EC%A0%84%EA%B2%BD.jpg',
      ),
      TravelItemVo(type: TravelDetailType.text, description: '방콕 7'),
      TravelItemVo(
        type: TravelDetailType.image,
        description:
        'https://blog-static.kkday.com/ko/blog/wp-content/uploads/%EB%B0%A9%EC%BD%95-%EC%99%95%EA%B6%81-%EC%A0%84%EA%B2%BD.jpg',
      ),
      TravelItemVo(type: TravelDetailType.text, description: '방콕 여행8'),
      TravelItemVo(
        type: TravelDetailType.image,
        description:
        'https://blog-static.kkday.com/ko/blog/wp-content/uploads/%EB%B0%A9%EC%BD%95-%EC%99%95%EA%B6%81-%EC%A0%84%EA%B2%BD.jpg',
      ),
      TravelItemVo(type: TravelDetailType.text, description: '방콕 여행9'),
      TravelItemVo(
        type: TravelDetailType.image,
        description:
        'https://blog-static.kkday.com/ko/blog/wp-content/uploads/%EB%B0%A9%EC%BD%95-%EC%99%95%EA%B6%81-%EC%A0%84%EA%B2%BD.jpg',
      ),
      TravelItemVo(type: TravelDetailType.text, description: '방콕 여행10'),
      TravelItemVo(
        type: TravelDetailType.image,
        description:
        'https://blog-static.kkday.com/ko/blog/wp-content/uploads/%EB%B0%A9%EC%BD%95-%EC%99%95%EA%B6%81-%EC%A0%84%EA%B2%BD.jpg',
      ),
    ],
  ),
  TravelDetailVo(
    travelId: 2,
    items: [
      TravelItemVo(type: TravelDetailType.text, description: '오사카 여행'),
      TravelItemVo(
        type: TravelDetailType.image,
        description:
        'https://media.istockphoto.com/id/805105514/ko/%EC%82%AC%EC%A7%84/%EB%8F%84%ED%86%A4%EB%B3%B4%EB%A6%AC-%EC%9A%B4%ED%95%98-%EC%98%A4%EC%82%AC%EC%B9%B4-%EC%9D%BC%EB%B3%B8.jpg?s=1024x1024&w=is&k=20&c=M03JCIw8U-Se9VBOj0cDQXGW-6__-sz-p9gBnf4SN_g=',
      ),
      TravelItemVo(type: TravelDetailType.text, description: '오사카 여행2'),
      TravelItemVo(
        type: TravelDetailType.image,
        description:
        'https://media.istockphoto.com/id/805105514/ko/%EC%82%AC%EC%A7%84/%EB%8F%84%ED%86%A4%EB%B3%B4%EB%A6%AC-%EC%9A%B4%ED%95%98-%EC%98%A4%EC%82%AC%EC%B9%B4-%EC%9D%BC%EB%B3%B8.jpg?s=1024x1024&w=is&k=20&c=M03JCIw8U-Se9VBOj0cDQXGW-6__-sz-p9gBnf4SN_g=',
      ),
    ],
  ),
  TravelDetailVo(
    travelId: 3,
    items: [
      TravelItemVo(type: TravelDetailType.text, description: '제주도 여행'),
      TravelItemVo(
        type: TravelDetailType.image,
        description:
        'https://media.istockphoto.com/id/805105514/ko/%EC%82%AC%EC%A7%84/%EB%8F%84%ED%86%A4%EB%B3%B4%EB%A6%AC-%EC%9A%B4%ED%95%98-%EC%98%A4%EC%82%AC%EC%B9%B4-%EC%9D%BC%EB%B3%B8.jpg?s=1024x1024&w=is&k=20&c=M03JCIw8U-Se9VBOj0cDQXGW-6__-sz-p9gBnf4SN_g=',
      ),
      TravelItemVo(type: TravelDetailType.text, description: '제주도 여행2'),
      TravelItemVo(
        type: TravelDetailType.image,
        description:
        'https://media.istockphoto.com/id/805105514/ko/%EC%82%AC%EC%A7%84/%EB%8F%84%ED%86%A4%EB%B3%B4%EB%A6%AC-%EC%9A%B4%ED%95%98-%EC%98%A4%EC%82%AC%EC%B9%B4-%EC%9D%BC%EB%B3%B8.jpg?s=1024x1024&w=is&k=20&c=M03JCIw8U-Se9VBOj0cDQXGW-6__-sz-p9gBnf4SN_g=',
      ),
    ],
  ),
  TravelDetailVo(
    travelId: 4,
    items: [
      TravelItemVo(type: TravelDetailType.text, description: '영종도 여행'),
      TravelItemVo(
        type: TravelDetailType.image,
        description:
        'https://media.istockphoto.com/id/805105514/ko/%EC%82%AC%EC%A7%84/%EB%8F%84%ED%86%A4%EB%B3%B4%EB%A6%AC-%EC%9A%B4%ED%95%98-%EC%98%A4%EC%82%AC%EC%B9%B4-%EC%9D%BC%EB%B3%B8.jpg?s=1024x1024&w=is&k=20&c=M03JCIw8U-Se9VBOj0cDQXGW-6__-sz-p9gBnf4SN_g=',
      ),
      TravelItemVo(type: TravelDetailType.text, description: '영종도 여행2'),
      TravelItemVo(
        type: TravelDetailType.image,
        description:
        'https://media.istockphoto.com/id/805105514/ko/%EC%82%AC%EC%A7%84/%EB%8F%84%ED%86%A4%EB%B3%B4%EB%A6%AC-%EC%9A%B4%ED%95%98-%EC%98%A4%EC%82%AC%EC%B9%B4-%EC%9D%BC%EB%B3%B8.jpg?s=1024x1024&w=is&k=20&c=M03JCIw8U-Se9VBOj0cDQXGW-6__-sz-p9gBnf4SN_g=',
      ),
    ],
  ),
  TravelDetailVo(
    travelId: 5,
    items: [
      TravelItemVo(type: TravelDetailType.text, description: '강릉 여행'),
      TravelItemVo(
        type: TravelDetailType.image,
        description:
        'https://media.istockphoto.com/id/805105514/ko/%EC%82%AC%EC%A7%84/%EB%8F%84%ED%86%A4%EB%B3%B4%EB%A6%AC-%EC%9A%B4%ED%95%98-%EC%98%A4%EC%82%AC%EC%B9%B4-%EC%9D%BC%EB%B3%B8.jpg?s=1024x1024&w=is&k=20&c=M03JCIw8U-Se9VBOj0cDQXGW-6__-sz-p9gBnf4SN_g=',
      ),
      TravelItemVo(type: TravelDetailType.text, description: '강릉 여행2'),
      TravelItemVo(
        type: TravelDetailType.image,
        description:
        'https://media.istockphoto.com/id/805105514/ko/%EC%82%AC%EC%A7%84/%EB%8F%84%ED%86%A4%EB%B3%B4%EB%A6%AC-%EC%9A%B4%ED%95%98-%EC%98%A4%EC%82%AC%EC%B9%B4-%EC%9D%BC%EB%B3%B8.jpg?s=1024x1024&w=is&k=20&c=M03JCIw8U-Se9VBOj0cDQXGW-6__-sz-p9gBnf4SN_g=',
      ),
    ],
  )
];
