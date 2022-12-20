import 'package:dio/dio.dart';

class ApiClient {
  Dio dio = Dio(BaseOptions(
    baseUrl: "https://third-exam.free.mockoapp.net/products",
    connectTimeout: 25000,
    receiveTimeout: 20000,
  ));
}
