import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/api/server_locator.dart';
import 'package:ecommerce_app/core/utils/app_router.dart';
import 'package:ecommerce_app/features/authantication/data/repo/auth_repo_impl.dart';
import 'package:ecommerce_app/features/authantication/presentation/manger/authantication/authantication_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/cache/cache_helper.dart';

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
          )
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
