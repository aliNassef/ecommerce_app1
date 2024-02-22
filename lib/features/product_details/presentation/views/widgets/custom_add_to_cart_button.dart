import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../constants.dart';

class CustomAddToCartButton extends StatelessWidget {
  const CustomAddToCartButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          GoRouter.of(context).push('/CartView');
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: kPrimaryColor,
          ),
          height: 48.h,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.add_shopping_cart_outlined,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  const Text(
                    'Add to cart',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
