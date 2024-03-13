import 'package:ecommerce_app/core/utils/assets.dart';
import 'package:flutter/material.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.fill,
          ImageData.splashScreen,
        ),
      ],
    );
  }
}
