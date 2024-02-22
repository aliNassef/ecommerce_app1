import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key, required this.hint, this.suffixIcon, this.hold = false});
  final String hint;
  final Widget? suffixIcon;
  final bool hold;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: hold,
      cursorColor: kPrimaryColor,
      style: Styles.textStyle18.copyWith(color: kPrimaryColor),
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: Colors.white,
        hintText: hint,
        hintStyle: Styles.textStyle18.copyWith(
          fontWeight: FontWeight.w300,
          color: const Color(0xff000000).withOpacity(
            .17,
          ),
        ),
        enabledBorder: textFormFieldBorder(),
        focusedBorder: textFormFieldBorder(),
      ),
    );
  }

  OutlineInputBorder textFormFieldBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(
        color: Colors.white,
      ),
    );
  }
}
