// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enneagram_question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EnneagramQuestion _$EnneagramQuestionFromJson(Map<String, dynamic> json) =>
    EnneagramQuestion(
      json['questionNumber'] as int?,
      json['question'] as String?,
      json['enneagramType'] as int?,
      $enumDecodeNullable(_$TestTypeEnumMap, json['testType']),
      json['uniqueString'] as String?,
      json['score'] as int?,
    );

Map<String, dynamic> _$EnneagramQuestionToJson(EnneagramQuestion instance) =>
    <String, dynamic>{
      'questionNumber': instance.questionNumber,
      'question': instance.question,
      'enneagramType': instance.enneagramType,
      'testType': _$TestTypeEnumMap[instance.testType],
      'uniqueString': instance.uniqueString,
      'score': instance.score,
    };

const _$TestTypeEnumMap = {
  TestType.select: 'select',
  TestType.simple: 'simple',
  TestType.hard: 'hard',
};
