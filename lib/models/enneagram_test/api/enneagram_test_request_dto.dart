enum TestType {
  select, simple, hard
}

extension ParseToString on TestType {
  String get name {
    return this.toString().split('.').last;
  }
}

class EnneagramTestRequestDto {
  String? testId;
  String userId;
  TestType testType;
  int? myEnneagramType;
  int? myWingType;
  String? uniqueString;
  int? type1Score;
  int? type2Score;
  int? type3Score;
  int? type4Score;
  int? type5Score;
  int? type6Score;
  int? type7Score;
  int? type8Score;
  int? type9Score;

  EnneagramTestRequestDto({
      this.testId,
      required this.userId,
      required this.testType,
      this.myEnneagramType,
      this.myWingType,
      this.uniqueString,
      this.type1Score,
      this.type2Score,
      this.type3Score,
      this.type4Score,
      this.type5Score,
      this.type6Score,
      this.type7Score,
      this.type8Score,
      this.type9Score});

  Map<String, dynamic> toJson() => {
    'testId': testId,
    'userId': userId,
    'testType': testType.name,
    'myEnneagramType': myEnneagramType,
    'myWingType': myWingType,
    'uniqueString': uniqueString,
    'type1Score': type1Score,
    'type2Score': type2Score,
    'type3Score': type3Score,
    'type4Score': type4Score,
    'type5Score': type5Score,
    'type6Score': type6Score,
    'type7Score': type7Score,
    'type8Score': type8Score,
    'type9Score': type9Score,
  };
}