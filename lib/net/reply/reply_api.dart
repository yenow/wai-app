import 'dart:convert';

import 'package:wai/common/utils/function.dart';
import 'package:wai/common/utils/logger.dart';
import 'package:wai/models/reply/api/reply_request_dto.dart';

Future<void> deleteReply(ReplyRequestDto replyRequestDto) async {
  logger.d(replyRequestDto.toJson());
  var response = await postRequest("/api/deleteReply", json.encode(replyRequestDto.toJson()));
}

Future<void> reportReply(ReplyRequestDto replyRequestDto) async {
  logger.d(replyRequestDto.toJson());
  var response = await postRequest("/api/reportReply", json.encode(replyRequestDto.toJson()));
}