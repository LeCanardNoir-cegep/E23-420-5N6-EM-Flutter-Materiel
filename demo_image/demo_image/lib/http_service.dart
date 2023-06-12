import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';

class HttpService{
  static final CookieManager cookieManager = CookieManager(CookieJar());
  static final Dio dio = Dio(BaseOptions(baseUrl: "http://10.0.2.2:8080"))..interceptors.add(cookieManager);
  Map<String,String> cookie = {};


  Future<String?> sendSingleFileImage(String imgPath) async {
    print("Envoie la caliss d'image");
    FormData fData = FormData.fromMap(
        {"file": await MultipartFile.fromFile(imgPath)}
    );
    try{
      Response res = await dio.post("/singleFile", data: fData);
      return "${dio.options.baseUrl}/singleFile/${res.data.toString()}";
    }on DioException catch(e){
      print(e.message);
    }
  }

  Future<String?> signin() async {
    try{
      Response res = await dio.post("/api/id/signin", data: {"username": "bruno", "password": "1234"});
      Cookie c = await cookieManager.cookieJar.loadForRequest(Uri.parse(dio.options.baseUrl)).then((value) => value.first);
      cookie = {"Cookie": "${c.name}=${c.value}"};
      return res.data["username"];
    }on DioException catch(e){
      print(e.message);
    }
  }

  Future<String?> sendApiSingleFileImage(String imgPath) async {
    //Cookie cookie = await cookieManager.cookieJar.loadForRequest(Uri.parse(_dio.options.baseUrl)).then((value) => value.first);
    FormData fData = FormData.fromMap(
        {"file": await MultipartFile.fromFile(imgPath)}
    );
    try{
      Response res = await dio.post("/singleFile", data: fData);
      return "${dio.options.baseUrl}/singleFile/${res.data.toString()}";
    }on DioException catch(e){
      print(e.message);
    }
  }

}