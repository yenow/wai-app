import 'dart:io';

import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:wai/data/model/ban_user/ban_user.dart';
import 'package:wai/data/model/ban_user/ban_user_request.dart';
import 'package:wai/data/model/user/user.dart';
import 'package:wai/data/model/user/user_request_dto.dart';
import '../model/enneagram_test/enneagram_test.dart';

part 'ban_user_client.g.dart';

@RestApi()
abstract class BanUserClient {
  factory BanUserClient(Dio dio, {String baseUrl}) = _BanUserClient;

  @GET('/banUsers/{userId}')
  Future<List<BanUser>> getBanUsers({
    @Path("userId") required int userId,
    @Header("authorization") required String token
  });

  @POST('/banUser/create')
  Future<BanUser> createBanUser({
    @Body() required BanUserRequest banUserRequest,
    @Header("authorization") required String token
  });

  @DELETE('/banUser/delete')
  Future<BanUser> deleteBanUser({
    @Body() required BanUserRequest banUserRequest,
    @Header("authorization") required String token
  });
}