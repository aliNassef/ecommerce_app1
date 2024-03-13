import 'package:ecommerce_app/core/api/end_ponits.dart';
import 'package:ecommerce_app/core/cache/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'widgets/splash_view_body.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
      () {
        CacheHelper().getData(key: ApiKey.token) == null
            ? context.go('/SignIn')
            : context.go('/HomeView');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashViewBody(),
    );
  }
}
