import 'package:http/http.dart' as http;

void main() async {
  String url = "https://eunjin3786.pythonanywhere.com/question/all/";
  Uri urlPath = Uri(path: url);
  var response = await http.get(urlPath);
  var statusCode = response.statusCode;
  var responseHeaders = response.headers;
  var responseBody = response.body;

  print("statusCode: ${statusCode}");
  print("responseHeaders: ${responseHeaders}");
  print("responseBody: ${responseBody}");

  //runApp(MyApp());
}