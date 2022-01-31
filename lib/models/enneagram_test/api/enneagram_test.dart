import 'package:enum_to_string/enum_to_string.dart';

import 'enneagram_test_request_dto.dart';

class EnneagramTest {
  int? testId;
  int? userId;
  TestType? testType;
  int? myEnneagramType;
  int? myWingType;
  int? type1Score;
  int? type2Score;
  int? type3Score;
  int? type4Score;
  int? type5Score;
  int? type6Score;
  int? type7Score;
  int? type8Score;
  int? type9Score;

  EnneagramTest({
      this.testId,
      required this.userId,
      this.testType,
      this.myEnneagramType,
      this.myWingType,
      this.type1Score,
      this.type2Score,
      this.type3Score,
      this.type4Score,
      this.type5Score,
      this.type6Score,
      this.type7Score,
      this.type8Score,
      this.type9Score});

  factory EnneagramTest.fromJson(Map<String, dynamic> json) {
    return EnneagramTest(
      testId: json['testId'],
      userId: json['userId'],
      testType: EnumToString.fromString(TestType.values, json['testType'] as String),
      myEnneagramType: json['myEnneagramType'],
      myWingType: json['myWingType'],
      type1Score: json['type1Score'],
      type2Score: json['type2Score'],
      type3Score: json['type3Score'],
      type4Score: json['type4Score'],
      type5Score: json['type5Score'],
      type6Score: json['type6Score'],
      type7Score: json['type7Score'],
      type8Score: json['type8Score'],
      type9Score: json['type9Score'],
    );
  }
}