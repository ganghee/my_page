class BookVo {
  String title;
  String author;
  String publisher;
  String coverImage;
  String description;

  BookVo({
    required this.title,
    required this.author,
    required this.publisher,
    required this.coverImage,
    required this.description,
  });
}

List<BookVo> myBooks = [
  BookVo(
    title: '데미안',
    author: '헤르만 헤세',
    publisher: '민음사',
    coverImage: 'https://minumsa.minumsa.com/wp-content/uploads/bookcover/044_%EB%8D%B0%EB%AF%B8%EC%95%88-300x504.jpg',
    description: '',
  ),
  BookVo(
    title: '여기는 커스터드, 특별한 도시락을 팝니다',
    author: '가토 겐',
    publisher: '필름',
    coverImage: 'https://image.yes24.com/goods/110643268/XL',
    description: '',
  ),
  BookVo(
    title: '하쿠다 사진관',
    author: '허태연',
    publisher: '놀',
    coverImage: 'https://image.yes24.com/goods/110733803/XL',
    description: '',
  ),
  BookVo(
    title: '리더의 말그릇',
    author: '김윤나',
    publisher: '카시오페아',
    coverImage: 'https://image.yes24.com/goods/98897587/XL',
    description: '',
  ),
  BookVo(
    title: '리더의 질문법',
    author: '에드거 샤인, 피터 샤인',
    publisher: '심심',
    coverImage: 'https://image.yes24.com/goods/107997384/XL',
    description: '',
  ),
  BookVo(
    title: '메리골드 마음 세탁소',
    author: '윤정은',
    publisher: '북로망스',
    coverImage: 'https://image.yes24.com/goods/124339743/XL',
    description: '',
  ),
  BookVo(
    title: '메리골드 마음 사진관',
    author: '윤정은',
    publisher: '북로망스',
    coverImage: 'https://image.yes24.com/goods/117716170/XL',
    description: '',
  ),
  BookVo(
    title: '두려움 없는 조직',
    author: '에이미 에드먼드슨',
    publisher: '다산북스',
    coverImage: 'https://image.yes24.com/goods/79633189/XL',
    description: '',
  ),
  BookVo(
    title: '구의 증명',
    author: '최진영',
    publisher: '은행나무',
    coverImage: 'https://image.yes24.com/goods/118578901/XL',
    description: '',
  ),
  BookVo(
    title: '어서오세요, 휴남동 서점입니다',
    author: '황보름',
    publisher: '클레이하우스',
    coverImage: 'https://image.yes24.com/goods/106211628/XL',
    description: '',
  ),
  BookVo(
    title: '밝은 밤',
    author: '최은영',
    publisher: '문학동네',
    coverImage: 'https://image.yes24.com/goods/102687133/XL',
    description: '',
  ),
];
