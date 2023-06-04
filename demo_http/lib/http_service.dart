import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';

import 'transfer.dart';

class HttpService{
  late Dio _dio;
  static CookieManager cookieManager = CookieManager(CookieJar());

  HttpService(){
    _dio = _dio = Dio();
    _dio.interceptors.add(cookieManager);
  }

  Future<String> getHttpIp() async{
      try{
        return await _dio.get("https://api.ipify.org").then((value) => value.data);
      }catch(e,s){
        print(e);
        print(s);
        throw(e);
      }
  }

  Future<User> getHttpUser(int userId) async{
    // https://jsonplaceholder.typicode.com/todos
    // https://jsonplaceholder.typicode.com/todos?userId=2&completed=false
    // https://jsonplaceholder.typicode.com/users
      try{
        var response = await _dio.get("https://jsonplaceholder.typicode.com/users?id=$userId");
        return User.fromJson(response.data[0]);
      }catch(e,s){
        print(e);
        print(s);
        throw(e);
      }
  }


  Future<List<User>> getHttpListUser() async{
    // https://jsonplaceholder.typicode.com/todos
    // https://jsonplaceholder.typicode.com/todos?userId=2&completed=false
    // https://jsonplaceholder.typicode.com/users
    try{
      var response = await _dio.get("https://jsonplaceholder.typicode.com/users");
      var listJson = response.data as List;
      return listJson.map((e) => User.fromJson(e)).toList();
    }catch(e,s){
      print(e);
      print(s);
      throw(e);
    }
  }

  Future<SignupResponse> signup(SignupRequest req) async {
    try{
      var response = await _dio.post(
          "http://10.0.2.2:8080/api/id/signup",
          data: req.toJson()
      );
      return SignupResponse.fromJson(response.data);
    }catch(e,s){
      print(e);
      print(s);
      throw(e);
    }
  }

  Future<SigninResponse> signin(SigninRequest req) async {
    try{
      var response = await _dio.post(
          "http://10.0.2.2:8080/api/id/signin",
          data: req.toJson()
      );
      return SigninResponse.fromJson(response.data);
    }catch(e,s){
      print(e);
      print(s);
      throw(e);
    }
  }

  Future<String> signout() async {
    try{
      var response = await _dio.get(
          "http://10.0.2.2:8080/api/id/signout"
      );
      return response.data;
    }catch(e,s){
      print(e);
      print(s);
      throw(e);
    }
  }



  Future<List<HomeResponse>> home() async {
    try{
      var response = await _dio.get(
          "http://10.0.2.2:8080/api/home"
      );
      var listJson = response.data as List;
      return listJson.map((e) => HomeResponse.fromJson(e)).toList();
    }catch(e,s){
      print(e);
      print(s);
      throw(e);
    }
  }

}
