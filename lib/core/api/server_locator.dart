import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/api/dio_consumer.dart';
import 'package:ecommerce_app/features/home/data/repos/home_repo/home_repo_impl.dart';
import 'package:ecommerce_app/features/product_list/data/repo/product_list_repo_impl.dart';
import 'package:get_it/get_it.dart';
import '../../features/auth/data/repo/auth_repo_impl.dart';

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
  getIt.registerSingleton<ProductListRepoImpl>(
    ProductListRepoImpl(
      api: getIt.get<DioConsumer>(),
    ),
  );
}
