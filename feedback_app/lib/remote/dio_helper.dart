import 'dart:convert';

import 'package:dio/dio.dart';

class DioHelper {
 static Dio dio = Dio();


 static init(){
   dio = Dio(
     BaseOptions(
       baseUrl: "http://registesys.atwebpages.com/",
       receiveDataWhenStatusError: true,

     )
   );
 }

 static Future<Response> getData({
    required String path ,
    Map<String,dynamic>? query,
 }

 )async{

 return await dio.get(path,queryParameters:query ,);
}

static Future<Response> postData ({
  required String path ,
  Map<String,dynamic>? query,
  required Map<String,dynamic> data
})async{

   return await dio.post(path,queryParameters: query,data: data);
}



 static Future<Response> putData ({
   required String path ,
   Map<String,dynamic>? query,
   required Map<String,dynamic> data
 })async{


   return await dio.put(path,queryParameters: query,data: data);
 }
}