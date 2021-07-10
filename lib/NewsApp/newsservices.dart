import 'package:dio/dio.dart';
import 'package:dummy/ImageGetXApp/imageservice.dart';
import 'package:dummy/NewsApp/newsInfo.dart';

// ignore: camel_case_types
class NewsService {
  BaseOptions options = BaseOptions(
      baseUrl: 'https://newsapi.org/',
      followRedirects: false,
      validateStatus: (status) => true);
  // NewsModel? newsModel;
  Future<NewsModel> getNews(String newsUrl) async {
    print(newsUrl);
    final _dioInstance = Dio(options);

    try {
      final response = await _dioInstance
          .request(newsUrl, options: Options(method: 'GET'))
          .catchError((error) {
        throw HttpException(500,
            message: "Please check the Internet Connection");
      });
      if (response.statusCode! < 200 || response.statusCode! > 226) {
        throw HttpException(response.statusCode!);
      } else {
        var jsonString = response.data;
        // var jsonMap = json.decode(jsonString);
        //
        // newsModel = NewsModel.fromJson(jsonMap);
        // var jsondata = json.encode(jsonString);
        // var jsonMap = json.decode(jsondata);

        return NewsModel.fromJson(jsonString);
        // return newsModel!;
      }
    } catch (e) {
      throw e;
    }
  }
}
