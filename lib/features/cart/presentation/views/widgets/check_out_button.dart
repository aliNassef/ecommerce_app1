
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../constants.dart';

class CheckOutButton extends StatelessWidget {
  const CheckOutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () async {},
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
                  SizedBox(
                    width: 24.w,
                  ),
                  Text(
                    'Check Out',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 24.w,
                  ),
                  const Icon(
                    Icons.trending_flat,
                    color: Colors.white,
                    size: 24,
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
