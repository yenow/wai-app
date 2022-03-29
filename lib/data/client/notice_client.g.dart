// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notice_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _NoticeClient implements NoticeClient {
  _NoticeClient(this._dio, {this.baseUrl});

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<Notice>> getNotices(
      {required noticeRequestDto, required token}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(noticeRequestDto.toJson());
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<Notice>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/notices',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => Notice.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<Notice> clearNotice(
      {required noticeRequestDto, required token}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(noticeRequestDto.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Notice>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/notice/clear',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Notice.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ResponseDto> clearAllNotice(
      {required noticeRequestDto, required token}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(noticeRequestDto.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ResponseDto>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/notice/clearAll',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ResponseDto.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
