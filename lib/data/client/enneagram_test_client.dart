import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:wai/data/model/enneagram/enneagram.dart';
import 'package:wai/data/model/enneagram/enneagram_question.dart';
import 'package:wai/data/model/enneagram_test/enneagram_test.dart';
import 'package:wai/data/model/user/user.dart';
import 'package:wai/data/model/user/user_request_dto.dart';

import '../../controller/permenent/app_controller.dart';

part 'enneagram_test_client.g.dart';

@RestApi()
abstract class EnneagramTestClient {
  factory EnneagramTestClient(Dio dio, {String baseUrl}) = _EnneagramTestClient;

  @GET('/enneagramTest/getHardEnneagramQuestion')
  Future<List<EnneagramQuestion>> getHardEnneagramQuestion();

  @GET('/enneagramTest/getSimpleEnneagramQuestion')
  Future<List<EnneagramQuestion>> getSimpleEnneagramQuestion();
}