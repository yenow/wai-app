import 'dart:convert';

class Enneagram {
  int? _enneagramType;
  String? _animalName;
  String? _imagePath;
  String? _subName;
  List<String>? _subNames;
  String? _simpleExplain;
  String? _simpleExplain2;

  Enneagram(this._enneagramType, this._animalName, this._imagePath, this._subName, this._simpleExplain, this._simpleExplain2);

  int get enneagramType => _enneagramType!;
  String get name => _animalName!;
  String get imagePath => _imagePath!;
  String get subName => _subName!;
  String get simpleExplain => _simpleExplain!;
  String get simpleExplain2 => _simpleExplain2!;

  String getFullName() {
    // "1유형[개혁가]"
    return '$_enneagramType유형[$subName]';
  }

  factory Enneagram.fromJson(Map<String, dynamic> json) {
    return Enneagram(
      json['enneagramType'],
      json['animalName'],
      json['imagePath'],
      json['subName'],
      json['simpleExplain'],
      json['simpleExplain2']
    );
  }

  @override
  String toString() {
    return 'Enneagram{_enneagramType: $_enneagramType, _animalName: $_animalName, _imagePath: $_imagePath, _subName: $_subName, _subNames: $_subNames, _simpleExplain: $_simpleExplain, _simpleExplain2: $_simpleExplain2}';
  }
}


// Map<num,Enneagram> dummyEnneagram = {
//   1 : Enneagram(1,'소','assets/images/enneagram/cow.png', "개혁가", "이상적이고 이상적인 유형",
//       "원칙적이고, 목표가 분명하며, 자신을 잘 통제하고, 완벽주의 기질이 있다."),
//   2 : Enneagram(2,' 강아지','assets/images/enneagram/dog.png', "돕는 사람", "사람들을 잘 돌보고 그들과 교류하기를 즐기는 유형",
//       "자신의 감정을 잘 드러내며, 사람들을 즐겁게 해 주고, 관대하며, 소유욕이 강하다."),
//   3 : Enneagram(3,'독수리','assets/images/enneagram/eagle.png', "성취하는 사람", "성공지향적이며 실용적인 유형",
//       "적응을 잘하고, 뛰어나며, 자신의 이미지에 관심이 많다."),
//   4 : Enneagram(4,'고양이','assets/images/enneagram/cat.png', "예술가", "민감하며 안으로 움츠러드는 유형",
//       "표현력이 있고, 극적이며, 자기 내면에 빠져 있으며, 변덕스럽다."),
//   5 : Enneagram(5,'부엉이','assets/images/enneagram/owl.png', "탐구자", "이성적이고 지혜가 있는 유형",
//       "지각력이 있고, 창의적이며, 혼자 있기를 좋아하고, 마음을 잘 드러내지 않는다."),
//   6 : Enneagram(6,'사슴','assets/images/enneagram/deer.png', "충실한 사람", "충실하고 안전을 추구하는 유형",
//       "책임감이 있고, 의심과 불안이 많으며, 사람들에게 맞추려고 한다."),
//   7 : Enneagram(7,'원숭이','assets/images/enneagram/monkey.png', "열정적인 사람", "늘 분주하며 재미를 추구하는 유형",
//       "즉흥적이고, 변덕스러우며, 욕심이 많고, 산만하다."),
//   8 : Enneagram(8,'호랑이','assets/images/enneagram/tiger.png', "도전하는 사람", "힘이 있으며 남을 지배하는 유형",
//       "자신감이 있고, 결단력이 있으며, 고집스럽고, 사람들과 맞서기를 좋아한다."),
//   9 : Enneagram(9,'코끼리','assets/images/enneagram/elephant.png', "평화주의자", "느긋하며 남들 앞에 나서지 않는 유형",
//       "수용적이며, 자족적이고, 남에게 쉽게 동의하며 위안을 준다."),
// };

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