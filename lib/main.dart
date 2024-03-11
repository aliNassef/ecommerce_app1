import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/api/server_locator.dart';
import 'package:ecommerce_app/core/utils/app_router.dart';
import 'package:ecommerce_app/features/home/data/repos/home_repo/home_repo_impl.dart';
import 'package:ecommerce_app/features/home/presentation/views/manger/category_cubit/categories_cubit.dart';
import 'package:ecommerce_app/features/home/presentation/views/manger/sub_category/sub_category_cubit.dart';
import 'package:ecommerce_app/features/product_list/presentation/manger/product_list_cubit/product_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/cache/cache_helper.dart';
import 'features/auth/data/repo/auth_repo_impl.dart';
import 'features/auth/presentation/manger/authantication/authantication_cubit.dart';
import 'features/cart/data/repo/cart_repo_impl.dart';
import 'features/cart/presentation/manger/cart_cubit/cart_cubit.dart';
import 'features/product_list/data/repo/product_list_repo_impl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper().init();
  setupGetIt();
  runApp(const EcommerceApp());
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthanticationCubit(getIt.get<AuthRepoImpl>()),
          ),
          BlocProvider(
            create: (context) => CategoriesCubit(getIt.get<HomeRepoImpl>()),
          ),
          BlocProvider(
            create: (context) => BrandCategoryCubit(getIt.get<HomeRepoImpl>()),
          ),
          BlocProvider(
            create: (context) =>
                ProductListCubit(getIt.get<ProductListRepoImpl>()),
          ),
          BlocProvider(
            create: (context) => CartCubit(
              getIt.get<CartRepoImpl>(),
            ),
          ),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: AppRouter.router,
          theme: ThemeData(
            scaffoldBackgroundColor: kPrimaryColor,
            textSelectionTheme: const TextSelectionThemeData(
              cursorColor: kPrimaryColor,
              selectionHandleColor: kPrimaryColor,
            ),
            textTheme: GoogleFonts.poppinsTextTheme(
              ThemeData.dark().textTheme,
            ),
          ),
        ),
      ),
    );
  }
}
