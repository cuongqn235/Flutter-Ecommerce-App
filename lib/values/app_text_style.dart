import 'package:bandongho/values/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTextStyle {
  static TextStyle textStylePrice = TextStyle(
      color: Colors.red,
      fontSize: 16,
      fontWeight: FontWeight.w600,
      shadows: [
        Shadow(blurRadius: 7, offset: Offset(0, 3), color: Colors.red.shade200)
      ]);
  static TextStyle textStyleProductName = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      shadows: [
        Shadow(blurRadius: 7, offset: Offset(0, 3), color: Colors.black38)
      ]);
}
