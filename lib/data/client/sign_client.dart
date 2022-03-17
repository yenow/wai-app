import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:wai/data/model/sign/sign.dart';
import 'package:wai/data/model/sign/sign_request_dto.dart';
import 'package:wai/data/model/user/user.dart';


part 'sign_client.g.dart';

@RestApi()
abstract class SignClient {
  factory SignClient(Dio dio, {String baseUrl}) = _SignClient;

  @POST('/sign/signUpAsNonMember')
  @Headers( <String, dynamic>{
    "Accept": "application/json",
    "Content-Type" : "application/json; charset=UTF-8",
  })
  Future<Sign> signUpAsNonMember({@Body() required SignRequestDto signRequestDto});
}