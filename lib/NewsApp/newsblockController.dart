import 'dart:async';

import 'package:dummy/NewsApp/newsInfo.dart';
import 'package:dummy/NewsApp/newsservices.dart';

enum NewsAction { Fetch, Delete }

class NewsBloc {
  NewsService newsService = NewsService();
  String url =
      'v2/everything?q=tesla&from=2021-06-09&sortBy=publishedAt&apiKey=6758161890f644efb49276b979f96a0b';

  final _newsStreamController = StreamController<List<Article>>();
  StreamSink<List<Article>> get _newsSink => _newsStreamController.sink;
  Stream<List<Article>> get newsStream => _newsStreamController.stream;

  // final _streamStreamController = StreamController<bool>();
  // StreamSink<bool> get _newsAvailableSink => _streamStreamController.sink;
  // Stream<bool> get newsAvailableStream => _streamStreamController.stream;

  final _eventStreamController = StreamController<NewsAction>();
  StreamSink<NewsAction> get eventSink => _eventStreamController.sink;
  Stream<NewsAction> get _eventStream => _eventStreamController.stream;

  NewsBloc() {
    _eventStream.listen((event) async {
      if (event == NewsAction.Fetch) {
        try {
          var news = await newsService.getNews(url);
          if (news != null) {
            _newsSink.add(news.articles!);
          }
        } on Exception catch (e) {
          _newsSink.addError(e.toString());
        }
      }
    });
  }

  void dispose() {
    _eventStreamController.close();
    _newsStreamController.close();
  }
}
