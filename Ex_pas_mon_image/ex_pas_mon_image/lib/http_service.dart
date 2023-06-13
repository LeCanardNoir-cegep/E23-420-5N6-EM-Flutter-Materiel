import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';

class HttpService{
  static String BASE_URL = "http://10.0.2.2:8080";
  final CookieManager _cookieManager = CookieManager(CookieJar());
  static late Dio _dio;
  HttpService(){
    _dio = Dio(BaseOptions(baseUrl: BASE_URL));
    _dio.interceptors.add(_cookieManager);
  }
  void setBaseUrl(String? url){
      BASE_URL = "http://10.0.2.2:8080";
  }
}