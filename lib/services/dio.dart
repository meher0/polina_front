import 'package:dio/dio.dart';

Dio dio() {
  Dio dio = new Dio();
  dio.options.baseUrl = "http://192.168.1.146:8000/api";
  dio.options.headers['content-Type'] = 'application/json';
  return dio;
}
