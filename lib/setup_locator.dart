
import 'package:get_it/get_it.dart';
import 'package:movies_project/services/repositories_service.dart';
import 'package:movies_project/services/web_service.dart';

var getIt = GetIt.instance;

void setupLocator(){

  getIt.registerLazySingleton(() => RepositoriesService());
  getIt.registerLazySingleton(() => WebService());

}