import 'package:json_annotation/json_annotation.dart';
import '../enneagram_test/enneagram_test_request_dto.dart';

part 'enneagram_question.g.dart';

@JsonSerializable()
class EnneagramQuestion {
  int? questionNumber;
  String? question;
  int? enneagramType;
  TestType? testType;
  String? uniqueString;
  int? score;

  EnneagramQuestion(this.questionNumber, this.question, this.enneagramType, this.testType, this.uniqueString, this.score);


  String getFullQuestion() {
    return "$questionNumber. $question";
  }

  String getFullSimpleQuestion() {
    return "$question";
  }

  factory EnneagramQuestion.fromJson(Map<String,dynamic> json) => _$EnneagramQuestionFromJson(json);
  Map<String,dynamic> toJson() => _$EnneagramQuestionToJson(this);

  @override
  String toString() {
    return 'EnneagramQuestion{questionNumber: $questionNumber, question: $question, enneagramType: $enneagramType, testType: $testType, score: $score}';
  }
}
