import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/api/dio_consumer.dart';
import 'package:ecommerce_app/features/authantication/data/repo/auth_repo_impl.dart';
import 'package:ecommerce_app/features/home/data/repos/home_repo/home_repo_impl.dart';
import 'package:ecommerce_app/features/home/data/repos/sub_category_repo/sub_category_repo_impl.dart';
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
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      api: DioConsumer(
        dio: Dio(),
      ),
    ),
  );
  getIt.registerSingleton<SubCategoryRepoImpl>(
    SubCategoryRepoImpl(
      api: DioConsumer(
        dio: Dio(),
      ),
    ),
  );
}
