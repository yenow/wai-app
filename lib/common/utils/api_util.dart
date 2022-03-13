
import 'dart:convert';
import 'package:http/http.dart' as http;

utf8Decoding(http.Response response) {
  return json.decode(utf8.decode(response.bodyBytes));
}