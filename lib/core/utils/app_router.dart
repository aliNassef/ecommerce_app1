import 'package:ecommerce_app/features/cart/presentation/views/cart_view.dart';
import 'package:ecommerce_app/features/home/presentation/views/home_view.dart';
import 'package:ecommerce_app/features/product_details/presentation/views/product_details_view.dart';
import 'package:ecommerce_app/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/views/sign_in_view.dart';
import '../../features/auth/presentation/views/sign_up_view.dart';

abstract class AppRouter {
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'SignIn',
            builder: (BuildContext context, GoRouterState state) {
              return const SignInView();
            },
          ),
          GoRoute(
            path: 'SignUp',
            builder: (BuildContext context, GoRouterState state) {
              return const SignUpView();
            },
          ),
          GoRoute(
            path: 'HomeView',
            builder: (BuildContext context, GoRouterState state) {
              return const HomeView();
            },
          ),
          GoRoute(
            path: 'ProdductDetails',
            builder: (BuildContext context, GoRouterState state) {
              return const ProductDetailsView();
            },
          ),
          GoRoute(
            path: 'CartView',
            builder: (BuildContext context, GoRouterState state) {
              return const CartView();
            },
          ),
        ],
      ),
    ],
  );
}
