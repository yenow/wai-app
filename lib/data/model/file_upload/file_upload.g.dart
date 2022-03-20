// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_upload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FileUpload _$FileUploadFromJson(Map<String, dynamic> json) => FileUpload(
      json['fileId'] as int,
      json['fileType'] as String,
      json['mimeType'] as String,
      json['uploadFileName'] as String,
      json['originalFileName'] as String,
      json['filePath'] as String,
      json['fileSize'] as int,
    );

Map<String, dynamic> _$FileUploadToJson(FileUpload instance) =>
    <String, dynamic>{
      'fileId': instance.fileId,
      'fileType': instance.fileType,
      'mimeType': instance.mimeType,
      'uploadFileName': instance.uploadFileName,
      'originalFileName': instance.originalFileName,
      'filePath': instance.filePath,
      'fileSize': instance.fileSize,
    };
