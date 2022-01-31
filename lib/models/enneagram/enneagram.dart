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