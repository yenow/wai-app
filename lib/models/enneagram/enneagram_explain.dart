
class EnneagramExplain {
  int enneagramType;
  List<String>? basicExplains;
  List<String>? merits;
  List<String>? demerits;
  List<String>? humanRelations;
  List<String>? surroundingEvaluations;
  List<String>? friendWays;
  List<String>? hardWorks;
  List<String>? comfortSentences;


  EnneagramExplain({
    required this.enneagramType,
    this.basicExplains,
    this.merits,
    this.demerits,
    this.humanRelations,
    this.surroundingEvaluations,
    this.friendWays,
    this.hardWorks,
    this.comfortSentences
  });


  factory EnneagramExplain.fromJson(Map<String, dynamic> jsonMap) {
    return EnneagramExplain(
      enneagramType: jsonMap['enneagramType'],
      basicExplains: List<String>.from(jsonMap['basicExplains']),
      merits: List<String>.from(jsonMap['merits']),
      demerits: List<String>.from(jsonMap['demerits']),
      humanRelations: List<String>.from(jsonMap['humanRelations']),
      surroundingEvaluations: List<String>.from(jsonMap['surroundingEvaluations']),
      friendWays: List<String>.from(jsonMap['friendWays']),
      hardWorks: List<String>.from(jsonMap['hardWorks']),
      comfortSentences: List<String>.from(jsonMap['comfortSentences']),
    );
  }

  @override
  String toString() {
    return 'EnneagramExplain{enneagramType: $enneagramType, basicExplains: $basicExplains, merits: $merits, demerits: $demerits, humanRelations: $humanRelations, surroundingEvaluations: $surroundingEvaluations, friendWays: $friendWays, hardWorks: $hardWorks, comfortSentences: $comfortSentences}';
  }
}