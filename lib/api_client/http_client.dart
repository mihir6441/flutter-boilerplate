import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpClients {
  static final HttpClients _instance = HttpClients.internal();
  HttpClients.internal();
  factory HttpClients() => _instance;

  final JsonDecoder _decoder = const JsonDecoder();

  Future<dynamic> get(String url) {
    return http.get(Uri.parse(url)).then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw Exception("Error while fetching data");
      }
      return _decoder.convert(res);
    });
  }

  Future<dynamic> post(String url, {Map? headers, body, encoding}) {
    return http
        .post(Uri.parse(url), body: body, headers: headers as Map<String, String>?, encoding: encoding)
        .then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw Exception("Error while fetching data");
      }
      return _decoder.convert(res);
    });
  }
}