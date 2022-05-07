import 'package:movies_project/repositories/movies_repository.dart';
import 'package:movies_project/services/web_service.dart';
import 'package:movies_project/setup_locator.dart';

class RepositoriesService {
  MoviesRepository moviesRepository =
      MoviesRepository(getIt<WebService>().moviesApi);
}
