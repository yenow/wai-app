import 'dart:io';

import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:wai/data/model/user/user.dart';
import 'package:wai/data/model/user/user_request_dto.dart';
import '../model/enneagram_test/enneagram_test.dart';

part 'user_client.g.dart';

@RestApi()
abstract class UserClient {
  factory UserClient(Dio dio, {String baseUrl}) = _UserClient;

  @POST('/user/getUserInformation')
  Future<User> getUserInformation({
    @Body() required UserRequestDto userRequestDto,
    @Header("authorization") required String token
  });

  @POST('/user/getUserEnneagramTests')
  Future<List<EnneagramTest>> getUserEnneagramTests({
    @Body() required UserRequestDto userRequestDto,
    @Header("authorization") required String token
  });

  @PATCH('/user/update')
  @Headers(<String, dynamic>{
    "Content-Type": "multipart/form-data"
  })
  @MultiPart()
  Future<User> userUpdate({
    @Part() required int userId,
    @Part() required String userKey,
    @Part() required String nickname,
    @Part() required File imageFile,
    @Header("authorization") required String token
  });
}