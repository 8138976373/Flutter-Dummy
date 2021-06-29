import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:dummy/model/image.dart';

class DioServices{
  static var  options = BaseOptions(
    baseUrl:  'https://api.unsplash.com/photos',
    // connectTimeout: 5000,
    // receiveTimeout: 3000,
  );
  static Future <dynamic> getAPI () async{
    final _dioInstance = Dio(options);
    _dioInstance.options.headers['Authorization'] = 'Client-ID L4slwGIywDElb1btpBrikJZpozksvydCo-B0OsjFYEU';
    final response = await _dioInstance.request(options.baseUrl,options: Options(method: 'GET'));
    print(response.data);
    if(response.statusCode == 200 ){
      var jsonString = response.data;
      var jsondata = json.encode(jsonString);
      // print(jsonString.toString());
      return imageFromJson(jsondata);
    }else{

    }
  }
   Future <dynamic> postAPI () async{
    final _dioInstance = Dio(options);
    final response = await _dioInstance.request('/api',options: Options(method: 'POST'));
  }


}