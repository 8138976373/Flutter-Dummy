import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dummy/model/image.dart';
import 'package:flutter/cupertino.dart';

class DioServices {
  BaseOptions _options = BaseOptions(
  baseUrl: 'https://api.unsplash.com/',
    followRedirects: false, validateStatus: (status) => true);

  Future getAPI(String url) async {
    try {
      final _dioInstance = Dio(_options);
      _dioInstance.options.headers['Authorization'] =
      'Client-ID L4slwGIywDElb1btpBrikJZpozksvydCo-B0OsjFYEU';
      final response = await _dioInstance
          .request(url, options: Options(method: 'GET'))
          .catchError((error) {
        throw HttpException(
            500, message: "Please check the Internet Connection");
      });
      // print(response.statusCode);
      if (response.statusCode! < 200 || response.statusCode! > 226) {
        throw HttpException(response.statusCode!);
      } else {
        var jsonString = response.data;
        String jsondata = json.encode(jsonString);
        print(response.data);
        return imageFromJson(jsondata);
      }
    }
    // on SocketException catch (e) {
    //   throw 'No Internet';
    // }
    catch (e) {
      // print(e);
      throw e;
    }
  }
}

  //
  // Future<dynamic> postAPI() async {
  //   final _dioInstance = Dio(_options);
  //   final response =
  //       await _dioInstance.request('/api', options: Options(method: 'POST'));
  // }
  //
  // static Future postData() async {
  //   Dio dio = new Dio();
  //   final String pathUrl = 'https://jsonplaceholder.typicode.com/posts';
  //
  //   dynamic data = {
  //     'title': 'Flutter Http post example',
  //     'body': 'Flutter post example',
  //     'userId': 1
  //   };
  //   var response1 = await dio.post(pathUrl,
  //       data: data,
  //       options: Options(headers: {
  //         'Content-type': 'application/json; charset=UTF-8',
  //       }));
  //   print(response1.data);
  //
  //   return response1.data;
  // }

// Future<List<Images>> fetchPhotos() async {
  //   BaseOptions options = new BaseOptions(
  //     followRedirects: false,
  //     validateStatus: (status) => true,
  //   );
  //   try {
  //     final _dioinstance = Dio(options);
  //
  //     _dioinstance.options.headers['Authorization'] =
  //         "Client-ID ${config.unsplash_key}";
  //
  //     final _fetchData =
  //         await _dioinstance.get('https://api.unsplash.com/photos');
  //     final List<PhotosModel> _photosData = [];
  //
  //     for (var _items in _fetchData.data) {
  //       _photosData.add(
  //           PhotosModel(id: _items['id'], imgURL: _items['urls']['regular']));
  //       print("object");
  //     }
  //
  //     return _photosData;
  //   } catch (e) {
  //     throw e;
  //   }
  // }


class HttpException implements Exception {
  final int statusCode;
  final String? message;
  String returnMessage='';

  HttpException(this.statusCode,{ this.message});

  String toString(){
    if(message != null){
      return message!;
    }
    statusCodeHandler();
    return returnMessage;
  }

  void statusCodeHandler(){

    switch(statusCode){
      case 400:
        this.returnMessage = "Bad request";
        break;
      case 401:
        this.returnMessage = "UnAuthorized access ";
        break;
      case 403:
        this.returnMessage = "Resource access forbidden";
        break;
      case 404:
        this.returnMessage = "Resource not Found";
        break;
      case 500:
        this.returnMessage = "Internal server error";
        break;
      default:
        this.returnMessage = "Unknown";
        break;

    }
  }
}
