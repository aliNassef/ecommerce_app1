import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/api/server_locator.dart';
import 'package:ecommerce_app/core/utils/app_router.dart';
import 'package:ecommerce_app/features/home/data/repos/home_repo/home_repo_impl.dart';
import 'package:ecommerce_app/features/home/presentation/views/manger/category_cubit/categories_cubit.dart';
import 'package:ecommerce_app/features/home/presentation/views/manger/sub_category/sub_category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/cache/cache_helper.dart';
import 'features/auth/data/repo/auth_repo_impl.dart';
import 'features/auth/presentation/manger/authantication/authantication_cubit.dart';
import 'features/home/data/repos/sub_category_repo/sub_category_repo_impl.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper().init();
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
