import 'package:flutter/material.dart';

extension SizeExtension on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.height;
  double get screenHeight => MediaQuery.of(this).size.height;
  double percentWidth(double value) => screenWidth * value;
  double percentHeight(double value) => screenHeight * value;
}
