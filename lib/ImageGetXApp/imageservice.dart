import 'dart:convert';
import 'package:dio/dio.dart';

import 'image.dart';

class DioServices extends Interceptor {
  // final ImageController imageController = Get.put(ImageController());
  String? returnMessage;
  // String jsondata;
  String token = 'Client-ID L4slwGIywDElb1btpBrikJZpozksvydCo-B0OsjFYEU';
  BaseOptions options = BaseOptions(
      baseUrl: 'https://api.unsplash.com/',
      followRedirects: false,
      validateStatus: (status) => true);

  Future getAPIs(String url) async {
    try {
      final _dioInstance = Dio(options);
      _dioInstance.options.headers['Authorization'] = token;
      _dioInstance.interceptors.add(InterceptorsWrapper(
          onRequest: (options, handler) async {
            if (token == null) {
              print('no token，request token firstly...');
              _dioInstance.lock();
            } else {
              final response = await _dioInstance.request(url,
                  options: Options(method: 'GET'));
              //     .catchError((error) {
              //   throw HttpException(500,
              //       message: "Please check the Internet Connection");
              // });
              if (response.statusCode! < 200 || response.statusCode! > 226) {
                String jsondata = "";
                throw HttpException(response.statusCode!);
              } else {
                var jsonString = response.data;
                String jsondata = json.encode(jsonString);
                print(response.data);
                imageFromJson(jsondata);
                return handler.resolve(response);
              }
            }

            return handler.next(options);
          },
          onResponse: (response, ResponseInterceptorHandler handler) async {},
          onError: (error, handler) {
            switch (error.response!.statusCode) {
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
            throw returnMessage!;
          }

          //     case 400:
          //       imageController.error = "Bad request" as RxString;
          //       break;
          //     case 401:
          //       imageController.error = "UnAuthorized access " as RxString;
          //       break;
          //     case 403:
          //       imageController.error = "Resource access forbidden" as RxString;
          //       break;
          //     case 404:
          //       imageController.error = "Resource not Found" as RxString;
          //       break;
          //     case 500:
          //       imageController.error = "Internal server error" as RxString;
          //       break;
          //     default:
          //       imageController.error = "Unknown" as RxString;
          //       break;
          //   }
          // },
          ));
      // return  imageFromJson(jsondata!);
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future getAPI(String url) async {
    try {
      final _dioInstance = Dio(options);
      _dioInstance.options.headers['Authorization'] =
          'Client-ID L4slwGIywDElb1btpBrikJZpozksvydCo-B0OsjFYEU';
      final response = await _dioInstance
          .request(url, options: Options(method: 'GET'))
          .catchError((error) {
        throw HttpException(500,
            message: "Please check the Internet Connection");
      });
      if (response.statusCode! < 200 || response.statusCode! > 226) {
        throw HttpException(response.statusCode!);
      } else {
        var jsonString = response.data;
        String jsondata = json.encode(jsonString);
        // print(response.data);
        return imageFromJson(jsondata);
      }
    } catch (e) {
      throw e;
    }
  }

  Future postAPI(String url) async {
    try {
      final _dioInstance = Dio(options);
      _dioInstance.options.headers['Authorization'] =
          'Client-ID L4slwGIywDElb1btpBrikJZpozksvydCo-B0OsjFYEU';
      final response = await _dioInstance
          .request(url, options: Options(method: 'POST'))
          .catchError((error) {
        throw HttpException(500,
            message: "Please check the Internet Connection");
      });
      if (response.statusCode! < 200 || response.statusCode! > 226) {
        throw HttpException(response.statusCode!);
      } else {
        var jsonString = response.data;
        String jsondata = json.encode(jsonString);
        print(response.data);
        return imageFromJson(jsondata);
      }
    } catch (e) {
      throw e;
    }
  }

  // @override
  // void onRequest(RequestOptions option, RequestInterceptorHandler handler) {
  //   final _dioInstance = Dio(options);
  //   if (token == null) {
  //     print('no token，request token firstly...');
  //     _dioInstance.lock();
  //   } else {
  //     final response = await _dioInstance
  //         .request(url, options: Options(method: 'GET'));
  //     //     .catchError((error) {
  //     //   throw HttpException(500,
  //     //       message: "Please check the Internet Connection");
  //     // });
  //     if (response.statusCode! < 200 || response.statusCode! > 226) {
  //       String jsondata = "";
  //       throw HttpException(response.statusCode!);
  //     } else {
  //       var jsonString = response.data;
  //       String jsondata = json.encode(jsonString);
  //       print(response.data);
  //       imageFromJson(jsondata);
  //       return handler.resolve(response);
  //     }
  //   }
  //
  //   return handler.next(options);
  //
  // }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    switch (err.response!.statusCode) {
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
    throw returnMessage!;
  }
}

class HttpException implements Exception {
  final int statusCode;
  final String? message;
  String returnMessage = '';

  HttpException(this.statusCode, {this.message});

  String toString() {
    if (message != null) {
      return message!;
    }
    statusCodeHandler();
    return returnMessage;
  }

  void statusCodeHandler() {
    switch (statusCode) {
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
