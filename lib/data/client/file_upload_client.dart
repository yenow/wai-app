import 'dart:io';

import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:wai/data/model/user/user.dart';
import 'package:wai/data/model/user/user_request_dto.dart';

part 'file_upload_client.g.dart';

@RestApi()
abstract class FileUploadClient {
  factory FileUploadClient(Dio dio, {String baseUrl}) = _FileUploadClient;

  @POST('/fileUpLoad/image')
  Future<User> getUserInformation({
    @Part() required String userId,
    @Part() required String userKey,
    @Part() required File imageFile,
    @Header("authorization") required String token
  });

  // @POST('/user/getUserEnneagramTests')
  // Future<List<EnneagramTest>> getUserEnneagramTests({
  //   @Body() required UserRequestDto userRequestDto,
  //   @Header("authorization") required String token
  // });
}