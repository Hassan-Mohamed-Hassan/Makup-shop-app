import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioClass{
  static Dio ?dio;
  static init(){
    dio=Dio(BaseOptions(
      //https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline;
      baseUrl: 'https://makeup-api.herokuapp.com/api/v1/',
      receiveDataWhenStatusError: true,
    ));
  }
  static Future<Response>GetData({required String url,Map<String,dynamic>?quary})async{
    return await dio!.get(url,queryParameters: quary);
  }

}