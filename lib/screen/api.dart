import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class CallApi {
  final String _url = "http://127.0.0.1:3000/";

  Map<String, String> requestHeaders = {
    'Content-type': 'multipart/form-data',
    'Accept': 'application/json'
  };
  Future<http.Response> postData(dynamic data, String apiUrl) async {
    final fullUrl = _url + apiUrl;

    final response = await http.post(
      Uri.parse(fullUrl),
      body: json.encode(data),
      headers: requestHeaders,
    );
    return response;
  }

  Future<http.Response> getData(String apiUrl) async {
    final fullUrl = _url + apiUrl;
    final response = await http.get(
      Uri.parse(fullUrl),
      headers: requestHeaders,
    );
    return response;
  }

  Future<http.Response> updateData(dynamic data, String apiUrl) async {
    final fullUrl = _url + apiUrl;
    final response = await http.put(
      Uri.parse(fullUrl),
      body: jsonEncode(data),
      headers: _setHeaders(),
    );
    return response;
  }

  Future<http.Response> deleteData(String apiUrl) async {
    final fullUrl = _url + apiUrl;
    final response =
        await http.delete(Uri.parse(fullUrl), headers: _setHeaders());
    return response;
  }

  Map<String, String> _setHeaders() {
    return {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
  }
}
