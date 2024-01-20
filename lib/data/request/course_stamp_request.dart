class CourseStampRequest {
  final String answer1;
  final String? answer2;
  final String answer3;
  final String answer4;
  final String answer5;
  final String answer6;
  final String answer7_1;
  final String answer7_2;
  final String answer7_3;
  final String answer7_4;

  const CourseStampRequest({
    required this.answer1,
    this.answer2,
    required this.answer3,
    required this.answer4,
    required this.answer5,
    required this.answer6,
    required this.answer7_1,
    required this.answer7_2,
    required this.answer7_3,
    required this.answer7_4,
  });

  Map<String, dynamic> toJson() {
    return {
      'responseOne': answer1,
      'responseTwo': answer2,
      'responseThree': answer3,
      'responseFour': answer4,
      'responseFive': answer5,
      'responseSix': answer6,
      'responseSevenOne': answer7_1,
      'responseSevenTwo': answer7_2,
      'responseSevenThree': answer7_3,
      'responseSevenFour': answer7_4,
    };
  }
}
