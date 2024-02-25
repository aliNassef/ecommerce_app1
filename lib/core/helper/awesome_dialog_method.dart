import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../utils/styles.dart';

AwesomeDialog awesomeDialogMethod(BuildContext context, String errMessage) {
  return AwesomeDialog(
    context: context,
    dialogType: DialogType.error,
    animType: AnimType.rightSlide,
    title: 'Failure',
    titleTextStyle: Styles.textStyle18.copyWith(
      color: kTextColor,
    ),
    descTextStyle: Styles.textStyle16.copyWith(color: kTextColor),
    desc: errMessage,
    btnOkOnPress: () {},
  );
}
