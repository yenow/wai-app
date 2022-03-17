import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';

// 1개의 파일 업로드
Future<void> uploadFile() async {
  // file picker를 통해 파일 선택
  FilePickerResult? result = await FilePicker.platform.pickFiles();

  if (result != null) {
    final filePath = result.files.single.path;

    // 파일 경로를 통해 formData 생성
    var dio = Dio();
    var formData = FormData.fromMap({
      'file' : await MultipartFile.fromFile(filePath!)
    });

    // 업로드 요청
    final response = await dio.post('/upload', data: formData);

  } else {
    // 아무런 파일도 선택되지 않음.
  }
}


// 여러개의 파일 업로드
Future<void> uploadFiles() async {
  // file picker를 통해 파일 여러개 선택
  FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: true);

  if (result != null) {
    final filePaths = result.paths;

    // 파일 경로를 통해 formData 생성
    var dio = Dio();
    var formData = FormData.fromMap({
      'files' : List.generate(filePaths.length,
              (index) => MultipartFile.fromFileSync(filePaths[index]!))
    });

    // 업로드 요청
    final response = await dio.post('/upload', data: formData);

  } else {
    // 아무런 파일도 선택되지 않음.
  }
}