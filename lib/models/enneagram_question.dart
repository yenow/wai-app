enum TestType{
  simpleTest, precsionTest
}

class EnneagramQuestion {
  num questionNumber;
  String question;
  num EnneagramType;
  TestType testType;

  EnneagramQuestion(this.questionNumber, this.question, this.EnneagramType, this.testType);

  @override
  String toString() {
    return 'EnneagramQuestion{questionNumber: $questionNumber, question: $question, EnneagramType: $EnneagramType, testType: $testType}';
  }
}

List<EnneagramQuestion> dummyEnneagramQuestionList = [
  EnneagramQuestion(1, "1. 질문입니다.", 1, TestType.simpleTest),
  EnneagramQuestion(2, "2. 질문입니다.질문입니다.", 2, TestType.simpleTest),
  EnneagramQuestion(3, "3. 질문입니다.질문입니다.질문입니다.", 3, TestType.simpleTest),
  EnneagramQuestion(4, "4. 질문입니다.질문입니다.질문입니다.질문입니다.", 4, TestType.simpleTest),
  EnneagramQuestion(5, "5. 질문입니다.질문입니다.질문입니다.질문입니다.질문입니다.", 5, TestType.simpleTest),
  EnneagramQuestion(6, "6. 질문입니다.질문입니다.질문입니다.질문입니다.질문입니다.질문입니다.", 6, TestType.simpleTest),
  EnneagramQuestion(7, "7. 질문입니다.질문입니다.질문입니다.질문입니다.질문입니다.질문입니다.질문입니다.", 7, TestType.simpleTest),
  EnneagramQuestion(8, "8. 질문입니다.질문입니다.질문입니다.질문입니다.질문입니다.질문입니다.질문입니다.질문입니다.", 8, TestType.simpleTest),
  EnneagramQuestion(9, "9. 질문입니다.질문입니다.질문입니다.질문입니다.질문입니다.질문입니다.질문입니다.질문입니다.질문입니다.", 9, TestType.simpleTest),
  EnneagramQuestion(10, "10. 질문입니다.", 1, TestType.simpleTest),
  EnneagramQuestion(11, "11. 질문입니다.질문입니다.", 2, TestType.simpleTest),
  EnneagramQuestion(12, "12. 질문입니다.질문입니다.질문입니다.", 3, TestType.simpleTest),
  EnneagramQuestion(13, "13. 질문입니다.질문입니다.질문입니다.질문입니다.", 4, TestType.simpleTest),
  EnneagramQuestion(14, "14. 질문입니다.질문입니다.질문입니다.질문입니다.질문입니다.", 5, TestType.simpleTest),
  EnneagramQuestion(15, "15. 질문입니다.질문입니다.질문입니다.질문입니다.질문입니다.질문입니다.", 6, TestType.simpleTest),
  EnneagramQuestion(16, "16. 질문입니다.질문입니다.질문입니다.질문입니다.질문입니다.질문입니다.질문입니다.", 7, TestType.simpleTest),
  EnneagramQuestion(17, "17. 질문입니다.질문입니다.질문입니다.질문입니다.질문입니다.질문입니다.질문입니다.질문입니다.", 8, TestType.simpleTest),
  EnneagramQuestion(18, "18. 질문입니다.질문입니다.질문입니다.질문입니다.질문입니다.질문입니다.질문입니다.질문입니다.질문입니다.", 9, TestType.simpleTest),
];