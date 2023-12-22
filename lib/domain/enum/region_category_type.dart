enum RegionCategoryType {
  all(value: '', title: '전체'),
  category1(value: '1', title: '강화군'),
  category2(value: '2', title: '옹진군'),
  category3(value: '3', title: '중구/동구/미추홀구'),
  category4(value: '4', title: '남동구/연수구'),
  category5(value: '5', title: '부평구/계양구/서구');

  final String title;
  final String value;

  const RegionCategoryType({
    required this.value,
    required this.title,
  });
}
