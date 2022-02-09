import 'dart:convert';

import 'package:wai/common/utils/function.dart';
import 'package:wai/models/reply/api/reply_request_dto.dart';

Future<void> deleteReply(ReplyRequestDto replyRequestDto) async {
  var response = await postRequest("/api/deleteReply", json.encode(replyRequestDto.toJson()));
}