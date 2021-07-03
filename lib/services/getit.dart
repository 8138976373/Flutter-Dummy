import 'package:dummy/services/apicall.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void serviceLocators(){
  locator.registerLazySingleton<DioServices>(() => DioServices());
}