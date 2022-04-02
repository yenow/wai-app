import 'package:dio/dio.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:wai/common/utils/logger.dart';
import 'package:wai/controller/permernent/app_controller.dart';
import 'package:wai/main.dart';

class TokenInterceptor extends Interceptor {
  Dio tempDio = Dio(
      BaseOptions(
        baseUrl: apiUrl,
        connectTimeout: 5000,
        receiveTimeout: 3000,
      )
  )..interceptors.add(LogInterceptor(responseBody: true, requestBody: true));

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {

    String token = AppController.to.loginInfo.value.token;
    if (AppController.to.loginInfo.value.userKey.isNotEmpty && JwtDecoder.isExpired(token)) {
      var response = await tempDio.post("/sign/signIn", data: AppController.to.loginInfo.value.toJson());
      AppController.to.loginInfo.value.token = response.data["token"];
    }

    options.headers["authorization"] = AppController.to.getJwtToken();
    // options.headers["authorization"] = AppController.to.loginInfo.value.token;
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // 특정 error(토큰이 만료)시, 토큰 받아오고 재요청
    return handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    return  handler.next(err);
  }
}