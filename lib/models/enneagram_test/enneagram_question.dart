import 'package:enum_to_string/enum_to_string.dart';
import 'api/enneagram_test_request_dto.dart';


class EnneagramQuestion {
  int? questionNumber;
  String? question;
  int? enneagramType;
  TestType? testType;
  String? uniqueString;
  int? score;

  EnneagramQuestion(this.questionNumber, this.question, this.enneagramType, this.testType, this.uniqueString, this.score);

  @override
  String toString() {
    return 'EnneagramQuestion{questionNumber: $questionNumber, question: $question, enneagramType: $enneagramType, testType: $testType, score: $score}';
  }

  String getFullQuestion() {
    return "$questionNumber. $question";
  }

  String getFullSimpleQuestion() {
    return "$uniqueString. $question";
  }

  factory EnneagramQuestion.fromJson(Map<String, dynamic> map) {
    return EnneagramQuestion(
        map['questionNumber'],
        map['question'],
        map['enneagramType'],
        EnumToString.fromString(TestType.values, map['testType'] as String) ,
        map['uniqueString'],
        null,
    );
  }

}
