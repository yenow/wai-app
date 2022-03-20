
import 'package:json_annotation/json_annotation.dart';

part 'file_upload.g.dart';

@JsonSerializable()
class FileUpload {
  int fileId;
  String fileType;
  String mimeType;
  String uploadFileName;
  String originalFileName;
  String filePath;
  int fileSize;

  FileUpload(this.fileId, this.fileType, this.mimeType, this.uploadFileName,
      this.originalFileName, this.filePath, this.fileSize);

  factory FileUpload.fromJson(Map<String, dynamic> json) => _$FileUploadFromJson(json);
  Map<String, dynamic> toJson() => _$FileUploadToJson(this);

  @override
  String toString() {
    return 'FileUpload{fileId: $fileId, fileType: $fileType, mimeType: $mimeType, uploadFileName: $uploadFileName, originalFileName: $originalFileName, filePath: $filePath, fileSize: $fileSize}';
  }
}