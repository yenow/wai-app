import 'enneagram_test_request_dto.dart';

class EnneagramQuestion {
  num questionNumber;
  String question;
  num EnneagramType;
  TestType testType;
  num? score;

  EnneagramQuestion(this.questionNumber, this.question, this.EnneagramType, this.testType, this.score);

  @override
  String toString() {
    return 'EnneagramQuestion{questionNumber: $questionNumber, question: $question, EnneagramType: $EnneagramType, testType: $testType, score: $score}';
  }
}

List<EnneagramQuestion> dummyEnneagramQuestionList = [
  EnneagramQuestion(1, "1. 질문입니다.", 1, TestType.simple, null),
  EnneagramQuestion(2, "2. 질문입니다.질문입니다.", 2, TestType.simple, null),
  EnneagramQuestion(3, "3. 질문입니다.질문입니다.질문입니다.", 3, TestType.simple, null),
  EnneagramQuestion(4, "4. 질문입니다.질문입니다.질문입니다.질문입니다.", 4, TestType.simple, null),
  EnneagramQuestion(5, "5. 질문입니다.질문입니다.질문입니다.질문입니다.질문입니다.", 5, TestType.simple, null),
  EnneagramQuestion(6, "6. 질문입니다.질문입니다.질문입니다.질문입니다.질문입니다.질문입니다.", 6, TestType.simple, null),
  EnneagramQuestion(7, "7. 질문입니다.질문입니다.질문입니다.질문입니다.질문입니다.질문입니다.질문입니다.", 7, TestType.simple, null),
  EnneagramQuestion(8, "8. 질문입니다.질문입니다.질문입니다.질문입니다.질문입니다.질문입니다.질문입니다.질문입니다.", 8, TestType.simple, null),
  EnneagramQuestion(9, "9. 질문입니다.질문입니다.질문입니다.질문입니다.질문입니다.질문입니다.질문입니다.질문입니다.질문입니다.", 9, TestType.simple, null),
  EnneagramQuestion(10, "10. 질문입니다.", 1, TestType.simple, null),
  EnneagramQuestion(11, "11. 질문입니다.질문입니다.", 2, TestType.simple, null),
  EnneagramQuestion(12, "12. 질문입니다.질문입니다.질문입니다.", 3, TestType.simple, null),
  EnneagramQuestion(13, "13. 질문입니다.질문입니다.질문입니다.질문입니다.", 4, TestType.simple, null),
  EnneagramQuestion(14, "14. 질문입니다.질문입니다.질문입니다.질문입니다.질문입니다.", 5, TestType.simple, null),
  EnneagramQuestion(15, "15. 질문입니다.질문입니다.질문입니다.질문입니다.질문입니다.질문입니다.", 6, TestType.simple, null),
  EnneagramQuestion(16, "16. 질문입니다.질문입니다.질문입니다.질문입니다.질문입니다.질문입니다.질문입니다.", 7, TestType.simple, null),
  EnneagramQuestion(17, "17. 질문입니다.질문입니다.질문입니다.질문입니다.질문입니다.질문입니다.질문입니다.질문입니다.", 8, TestType.simple, null),
  EnneagramQuestion(18, "18. 질문입니다.질문입니다.질문입니다.질문입니다.질문입니다.질문입니다.질문입니다.질문입니다.질문입니다.", 9, TestType.simple, null),
];