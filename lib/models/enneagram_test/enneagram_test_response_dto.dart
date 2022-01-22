import 'enneagram_test_request_dto.dart';

class EnneagramTestResponseDto {
  int? testId;
  int userId;
  TestType? testType;
  int? selectedEnneagramType;
  int? type1Score;
  int? type2Score;
  int? type3Score;
  int? type4Score;
  int? type5Score;
  int? type6Score;
  int? type7Score;
  int? type8Score;
  int? type9Score;

  EnneagramTestResponseDto({
      this.testId,
      required this.userId,
      this.testType,
      this.selectedEnneagramType,
      this.type1Score,
      this.type2Score,
      this.type3Score,
      this.type4Score,
      this.type5Score,
      this.type6Score,
      this.type7Score,
      this.type8Score,
      this.type9Score});

  factory EnneagramTestResponseDto.fromJson(Map<String, dynamic> json) {
    return EnneagramTestResponseDto(
      testId: json['testId'],
      userId: json['userId'],
      /*testType: json['testType'],*/
      selectedEnneagramType: json['selectedEnneagramType'],
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