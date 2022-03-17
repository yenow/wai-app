import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'enneagram.g.dart';

@JsonSerializable()
class Enneagram {
  int enneagramType;
  String animalName;
  String imagePath;
  String subName;
  List<String>? subNames;
  String simpleExplain;
  String simpleExplain2;
  String? simpleExplain3;

  Enneagram({
    required this.enneagramType,
    required this.animalName,
    required this.imagePath,
    required this.subName,
    required this.simpleExplain,
    required this.simpleExplain2,
    this.simpleExplain3
  });

  String getFullName() {
    return '$enneagramType유형[$subName]';  // "1유형[개혁가]"
  }

  factory Enneagram.fromJson(Map<String,dynamic> json) => _$EnneagramFromJson(json);
  Map<String,dynamic> toJson() => _$EnneagramToJson(this);

  @override
  String toString() {
    return 'Enneagram{enneagramType: $enneagramType, animalName: $animalName, imagePath: $imagePath, subName: $subName, subNames: $subNames, simpleExplain: $simpleExplain, simpleExplain2: $simpleExplain2, simpleExplain3: $simpleExplain3}';
  }
}