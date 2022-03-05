

import 'dart:convert';

import 'package:wai/common/utils/function.dart';
import 'package:wai/models/wise_saying/wise_saying.dart';
import 'package:wai/models/wise_saying/wise_saying_request_dto.dart';

Future<WiseSaying> getWiseSaying(WiseSayingRequestDto wiseSayingRequestDto) async {
  var response = await postRequest("/api/getWiseSaying", json.encode(wiseSayingRequestDto.toJson()));
  WiseSaying wiseSaying = WiseSaying.fromJson(json.decode(response));
  return wiseSaying;
}