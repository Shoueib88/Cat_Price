import 'package:flutter/material.dart';

class P {
  static const primarycolor = Color(0xfffbc821);
  static const whitecolor = Colors.white;
  static const blackcolor = Colors.black;
  static final greycolor = Colors.grey[300];
  static const sizwboxH20 = SizedBox(height: 20.0);
  static const sizeboxw20 = SizedBox(width: 20.0);

  // textstyle
  static textStyle({required double size, required Color color}) {
    return TextStyle(color: color, fontWeight: FontWeight.w500, fontSize: size);
  }

  //boxdecoration
  static boxdecoration(
      {required Color colorborder, required double value, Color? color}) {
    return BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(value)),
        border: Border.all(color: colorborder),
        color: color);
  }
}
