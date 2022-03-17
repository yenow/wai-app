// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enneagram_test.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EnneagramTest _$EnneagramTestFromJson(Map<String, dynamic> json) =>
    EnneagramTest(
      testId: json['testId'] as int?,
      userId: json['userId'] as int?,
      testType: $enumDecodeNullable(_$TestTypeEnumMap, json['testType']),
      myEnneagramType: json['myEnneagramType'] as int?,
      myWingType: json['myWingType'] as int?,
      type1Score: json['type1Score'] as int?,
      type2Score: json['type2Score'] as int?,
      type3Score: json['type3Score'] as int?,
      type4Score: json['type4Score'] as int?,
      type5Score: json['type5Score'] as int?,
      type6Score: json['type6Score'] as int?,
      type7Score: json['type7Score'] as int?,
      type8Score: json['type8Score'] as int?,
      type9Score: json['type9Score'] as int?,
      insertDate: json['insertDate'] == null
          ? null
          : DateTime.parse(json['insertDate'] as String),
    );

Map<String, dynamic> _$EnneagramTestToJson(EnneagramTest instance) =>
    <String, dynamic>{
      'testId': instance.testId,
      'userId': instance.userId,
      'testType': _$TestTypeEnumMap[instance.testType],
      'myEnneagramType': instance.myEnneagramType,
      'myWingType': instance.myWingType,
      'type1Score': instance.type1Score,
      'type2Score': instance.type2Score,
      'type3Score': instance.type3Score,
      'type4Score': instance.type4Score,
      'type5Score': instance.type5Score,
      'type6Score': instance.type6Score,
      'type7Score': instance.type7Score,
      'type8Score': instance.type8Score,
      'type9Score': instance.type9Score,
      'insertDate': instance.insertDate?.toIso8601String(),
    };

const _$TestTypeEnumMap = {
  TestType.select: 'select',
  TestType.simple: 'simple',
  TestType.hard: 'hard',
};
