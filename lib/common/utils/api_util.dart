
import 'dart:convert';
import 'package:http/http.dart' as http;

Map<String, dynamic> utf8Decoding(http.Response response) {
  return json.decode(utf8.decode(response.bodyBytes));
}