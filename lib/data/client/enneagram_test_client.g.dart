// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enneagram_test_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _EnneagramTestClient implements EnneagramTestClient {
  _EnneagramTestClient(this._dio, {this.baseUrl});

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<EnneagramQuestion>> getHardEnneagramQuestion() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<EnneagramQuestion>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(
                    _dio.options, '/enneagramTest/getHardEnneagramQuestion',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) =>
            EnneagramQuestion.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<EnneagramQuestion>> getSimpleEnneagramQuestion() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<EnneagramQuestion>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(
                    _dio.options, '/enneagramTest/getSimpleEnneagramQuestion',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) =>
            EnneagramQuestion.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<EnneagramTest> doSelectedEnneagramTestResult(
      {required enneagramTestRequestDto, required token}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(enneagramTestRequestDto.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<EnneagramTest>(Options(
                method: 'POST', headers: _headers, extra: _extra)
            .compose(
                _dio.options, '/enneagramTest/doSelectedEnneagramTestResult',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = EnneagramTest.fromJson(_result.data!);
    return value;
  }

  @override
  Future<EnneagramTest> doSimpleEnneagramTest(
      {required enneagramTestRequestDto, required token}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(enneagramTestRequestDto.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<EnneagramTest>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/enneagramTest/doSimpleEnneagramTest',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = EnneagramTest.fromJson(_result.data!);
    return value;
  }

  @override
  Future<EnneagramTest> doHardEnneagramTest(
      {required enneagramTestRequestDto, required token}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(enneagramTestRequestDto.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<EnneagramTest>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/enneagramTest/doHardEnneagramTest',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = EnneagramTest.fromJson(_result.data!);
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
