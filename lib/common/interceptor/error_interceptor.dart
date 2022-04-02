import 'package:dio/dio.dart';
import 'package:wai/common/utils/wai_dialog.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {

    return handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.response!.statusCode! >= 500) {
      WaiDialog.notify('알림', '서버에 에러가 발생했습니다.');
    }
    return handler.next(err);
  }
}