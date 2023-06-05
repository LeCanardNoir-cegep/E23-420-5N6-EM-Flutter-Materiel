import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HttpService{
  final BuildContext _context;
  final String _url;
  dynamic _showSnackBar;

  HttpService(this._context, this._url){
    _showSnackBar = ScaffoldMessenger.of(_context).showSnackBar;
  }

  Future<String> getStringData() async{
    try{
      Response res = await Dio().get(_url);
      if(res.statusCode! > 199 && res.statusCode! < 300 ){
        _showSnackBar(const SnackBar(content: Text("Success!!")));
        return res.data.toString();
      }
    }catch(e, s){
      print(e);
      print(s);
      _showSnackBar(const SnackBar(content: Text("Error!")));
    }
    return "";
  }

  Future<Map<String,dynamic>?> getJsonData(String param, String query) async{
    Uri uri = Uri.https(Uri.parse(_url).host, "", {param:query} );
    try{
      Response res = await Dio().get(uri.toString());
      if(res.statusCode! > 199 && res.statusCode! < 300 ){
        _showSnackBar(const SnackBar(content: Text("Success!!")));
        return res.data as Map<String,dynamic>;
      }
    }catch(e, s){
      print(e);
      print(s);
      _showSnackBar(const SnackBar(content: Text("Error!")));
    }
    return null;
  }

}