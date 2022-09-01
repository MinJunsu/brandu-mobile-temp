import 'dart:convert';

import 'package:http/http.dart';

class APIClient extends BaseClient {
  Map<String, String> _defaultHeader = {
    // 'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization':
        'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjY0MzMzMDAwLCJpYXQiOjE2NjE3NDEwMDAsImp0aSI6ImMyZmRlMDYyNDRhMDRlMTBiYWYxZDJiMmMwMjg0MWVhIiwidXNlcl9pZCI6NH0.zacx6_5YpyZLEfJMJoGi2MCEu07eupJxjXfi6lVMZ2s'
  };
  final Client _client = Client();

  // static const String baseURL = 'https://api.themealways.com';
  static const String baseURL = 'http://127.0.0.1:8000';

  @override
  Future<StreamedResponse> send(BaseRequest request) {
    return _client.send(request);
  }

  Future<Response> getRequest(String path, {Map<String, String>? headers}) {
    return _client.get(Uri.parse(baseURL + path),
        headers: _mergeHeader(headers));
  }

  Future<Response> postRequest(String path,
      {Map<String, String>? headers, Object? body, Encoding? encoding}) {
    return _client.post(Uri.parse(baseURL + path),
        body: body, encoding: encoding, headers: _mergeHeader(headers));
  }

  Future<Response> deleteRequest(String path,
      {Map<String, String>? headers, Object? body, Encoding? encoding}) {
    return _client.delete(Uri.parse(baseURL + path),
        body: body, encoding: encoding, headers: _mergeHeader(headers));
  }

  Future<Response> putRequest(String path,
      {Map<String, String>? headers, Object? body, Encoding? encoding}) {
    return _client.put(Uri.parse(baseURL + path),
        body: body, encoding: encoding, headers: _mergeHeader(headers));
  }

  Future<Response> patchRequest(String path,
      {Map<String, String>? headers, Object? body, Encoding? encoding}) {
    return _client.patch(Uri.parse(baseURL + path),
        body: body, encoding: encoding, headers: _mergeHeader(headers));
  }

  Map<String, String> _mergeHeader(Map<String, String>? headers) {
    return {..._defaultHeader, ...?headers};
  }

  void setHeader(Map<String, String> headers) {
    _defaultHeader = headers;
  }
}
