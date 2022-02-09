import 'dart:convert';

class Enneagram {
  int enneagramType;
  String animalName;
  String imagePath;
  String subName;
  List<String>? subNames;
  String simpleExplain;
  String simpleExplain2;
  String simpleExplain3;

  Enneagram({
    required this.enneagramType,
    required this.animalName,
    required this.imagePath,
    required this.subName,
    required this.simpleExplain,
    required this.simpleExplain2,
    required this.simpleExplain3
  });

  String getFullName() {
    // "1유형[개혁가]"
    return '$enneagramType유형[$subName]';
  }

  factory Enneagram.fromJson(Map<String, dynamic> json) {
    return Enneagram(
      enneagramType :json['enneagramType'],
      animalName: json['animalName'],
      imagePath: json['imagePath'],
      subName: json['subName'],
      simpleExplain: json['simpleExplain'],
      simpleExplain2: json['simpleExplain2'],
      simpleExplain3: json['simpleExplain3'] ?? "temp"
    );
  }

  @override
  String toString() {
    return 'Enneagram{enneagramType: $enneagramType, animalName: $animalName, imagePath: $imagePath, subName: $subName, subNames: $subNames, simpleExplain: $simpleExplain, simpleExplain2: $simpleExplain2}';
  }
}