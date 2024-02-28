import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class CustomForgetPassButton extends StatelessWidget {
  const CustomForgetPassButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          minimumSize: Size.zero,
        ),
        onPressed: () {},
        child: Text(
          'Forgot password',
          style: Styles.textStyle18.copyWith(
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
