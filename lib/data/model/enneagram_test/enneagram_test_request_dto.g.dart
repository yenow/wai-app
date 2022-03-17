// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enneagram_test_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EnneagramTestRequestDto _$EnneagramTestRequestDtoFromJson(
        Map<String, dynamic> json) =>
    EnneagramTestRequestDto(
      testId: json['testId'] as String?,
      userId: json['userId'] as String,
      testType: $enumDecode(_$TestTypeEnumMap, json['testType']),
      myEnneagramType: json['myEnneagramType'] as int?,
      myWingType: json['myWingType'] as int?,
      uniqueString: json['uniqueString'] as String?,
      type1Score: json['type1Score'] as int?,
      type2Score: json['type2Score'] as int?,
      type3Score: json['type3Score'] as int?,
      type4Score: json['type4Score'] as int?,
      type5Score: json['type5Score'] as int?,
      type6Score: json['type6Score'] as int?,
      type7Score: json['type7Score'] as int?,
      type8Score: json['type8Score'] as int?,
      type9Score: json['type9Score'] as int?,
    );

Map<String, dynamic> _$EnneagramTestRequestDtoToJson(
        EnneagramTestRequestDto instance) =>
    <String, dynamic>{
      'testId': instance.testId,
      'userId': instance.userId,
      'testType': _$TestTypeEnumMap[instance.testType],
      'myEnneagramType': instance.myEnneagramType,
      'myWingType': instance.myWingType,
      'uniqueString': instance.uniqueString,
      'type1Score': instance.type1Score,
      'type2Score': instance.type2Score,
      'type3Score': instance.type3Score,
      'type4Score': instance.type4Score,
      'type5Score': instance.type5Score,
      'type6Score': instance.type6Score,
      'type7Score': instance.type7Score,
      'type8Score': instance.type8Score,
      'type9Score': instance.type9Score,
    };

const _$TestTypeEnumMap = {
  TestType.select: 'select',
  TestType.simple: 'simple',
  TestType.hard: 'hard',
};
