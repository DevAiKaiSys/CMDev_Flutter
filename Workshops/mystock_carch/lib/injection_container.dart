import 'package:get_it/get_it.dart';
import 'package:mystock_carch/data/datasources/post_remote.dart';
import 'package:mystock_carch/data/services/dio_intercep.dart';

final getIt = GetIt.instance;

void setup() {
  // Bloc

  // Use cases

  // Repositories

  // Data sources
  getIt.registerLazySingleton<PostRemoteDataSource>(
      () => PostRemoteDataSource(client: getIt()));

  // Http service
  getIt.registerLazySingleton(() => DioInterceptors.dio);
}
