import 'package:dummy/ImageGetXApp/imageservice.dart';
import 'package:dummy/NewsApp/newsservices.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void serviceLocators() {
  locator.registerLazySingleton<DioServices>(() => DioServices());
  locator.registerLazySingleton<NewsService>(() => NewsService());
}
