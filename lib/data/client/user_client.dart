import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:wai/data/model/user/user.dart';
import 'package:wai/data/model/user/user_request_dto.dart';

import '../../controller/permenent/app_controller.dart';

part 'user_client.g.dart';

@RestApi()
abstract class UserClient {
  factory UserClient(Dio dio, {String baseUrl}) = _UserClient;

  @POST('/user/getUserInformation')
  Future<User> getUserInformation({
    @Body() required UserRequestDto userRequestDto,
    @Header("authorization") required String token
  });
}