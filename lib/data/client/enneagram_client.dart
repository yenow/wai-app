import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:wai/data/model/enneagram/enneagram.dart';
import 'package:wai/data/model/user/user.dart';
import 'package:wai/data/model/user/user_request_dto.dart';

import '../../controller/permernent/app_controller.dart';

part 'enneagram_client.g.dart';

@RestApi()
abstract class EnneagramClient {
  factory EnneagramClient(Dio dio, {String baseUrl}) = _EnneagramClient;

  @GET('/enneagram/getEnneagramInformation')
  Future<List<Enneagram>> getEnneagramInformation();
}