// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enneagram.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Enneagram _$EnneagramFromJson(Map<String, dynamic> json) => Enneagram(
      enneagramType: json['enneagramType'] as int,
      animalName: json['animalName'] as String,
      imagePath: json['imagePath'] as String,
      subName: json['subName'] as String,
      simpleExplain: json['simpleExplain'] as String,
      simpleExplain2: json['simpleExplain2'] as String,
      simpleExplain3: json['simpleExplain3'] as String?,
    )..subNames =
        (json['subNames'] as List<dynamic>?)?.map((e) => e as String).toList();

Map<String, dynamic> _$EnneagramToJson(Enneagram instance) => <String, dynamic>{
      'enneagramType': instance.enneagramType,
      'animalName': instance.animalName,
      'imagePath': instance.imagePath,
      'subName': instance.subName,
      'subNames': instance.subNames,
      'simpleExplain': instance.simpleExplain,
      'simpleExplain2': instance.simpleExplain2,
      'simpleExplain3': instance.simpleExplain3,
    };
