import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaseService extends GetConnect {
  Future<Response<dynamic>> getRequest({required String url}) async {
    debugPrint('GET Request: ${httpClient.baseUrl}$url');
    final data = await get(url);
    debugPrint('Response: ${data.body}');

    return data;
  }

  Future<Response<dynamic>> postRequest({required String url, required dynamic body}) async {
    debugPrint('POST Request: ${httpClient.baseUrl}$url');
    final data = await post(url, body);
    debugPrint('Body: $body');
    debugPrint('Response: ${data.body}');

    return data;
  }

  Future<Response<dynamic>> putRequest({required String url, required dynamic body}) async {
    debugPrint('PATCH Request: ${httpClient.baseUrl}$url');
    final data = await put(url, body);
    debugPrint('Body: $body');
    debugPrint('Response: ${data.body}');

    return data;
  }

  Future<Response<dynamic>> deleteRequest({required String url}) async {
    debugPrint('DELETE Request: ${httpClient.baseUrl}$url');
    final data = await delete(url);
    debugPrint('Response: ${data.body}');

    return data;
  }

  @override
  void onInit() {
    httpClient.baseUrl = 'https://api.contact-manager.project.skyshi.io';
    super.onInit();
  }
}