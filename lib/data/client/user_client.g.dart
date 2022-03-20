// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _UserClient implements UserClient {
  _UserClient(this._dio, {this.baseUrl});

  final Dio _dio;

  String? baseUrl;

  @override
  Future<User> getUserInformation(
      {required userRequestDto, required token}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(userRequestDto.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<User>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options, '/user/getUserInformation',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = User.fromJson(_result.data!);
    return value;
  }

  @override
  Future<List<EnneagramTest>> getUserEnneagramTests(
      {required userRequestDto, required token}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(userRequestDto.toJson());
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<EnneagramTest>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/user/getUserEnneagramTests',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => EnneagramTest.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<User> userUpdate(
      {required userId,
      required userKey,
      required nickname,
      required imageFile,
      required token}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Content-Type': 'multipart/form-data',
      r'authorization': token
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = FormData();
    _data.fields.add(MapEntry('userId', userId.toString()));
    _data.fields.add(MapEntry('userKey', userKey));
    _data.fields.add(MapEntry('nickname', nickname));
    _data.files.add(MapEntry(
        'imageFile',
        MultipartFile.fromFileSync(imageFile.path,
            filename: imageFile.path.split(Platform.pathSeparator).last)));
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<User>(
        Options(
                method: 'PATCH',
                headers: _headers,
                extra: _extra,
                contentType: 'multipart/form-data')
            .compose(_dio.options, '/user/update',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = User.fromJson(_result.data!);
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
