import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/api/dio_consumer.dart';
import 'package:ecommerce_app/features/authantication/data/repo/auth_repo_impl.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<DioConsumer>(DioConsumer(
    dio: Dio(),
  ));
  getIt.registerSingleton<AuthRepoImpl>(
    AuthRepoImpl(
      api: DioConsumer(
        dio: Dio(),
      ),
    ),
  );
}
