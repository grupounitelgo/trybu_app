import 'package:flutter/material.dart';

class AppTypography {
  AppTypography._();
  static TextStyle? bodyTextNormal(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1;
  }

  static TextStyle? bodyTextSemiBold(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .bodyText1!
        .copyWith(fontSize: 18, fontWeight: FontWeight.w700);
  }

  static TextStyle? bodyTextBold(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .bodyText1!
        .copyWith(fontSize: 18, fontWeight: FontWeight.w800);
  }
}
