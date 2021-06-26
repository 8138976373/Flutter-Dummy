
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dummy/model/image.dart';

class ApiCall{
  // static ApiCall apiRequest = new ApiCall();
  static Future <List<Images>?> fetchImages () async {
    try {
      final _dioInstance = Dio();
      _dioInstance.options.headers['Authorization'] = 'Client-ID L4slwGIywDElb1btpBrikJZpozksvydCo-B0OsjFYEU';
      Response response = await _dioInstance.get('https://api.unsplash.com/photos');
      if (response.statusCode == 200) {
        var jsonString = response.data;
        var jsondata = json.encode(jsonString);

        print(jsonString.toString());
        return imageFromJson(jsondata);
      } else {
        //show error message
        return null;
      }
      print(response);
    } catch (e) {
      print(e);
    }
  }


}