import 'package:flutter/material.dart';

import '../Const/Style.dart';

customCircle(
    {required void Function()? ontap,
    required String asset,
    required String text}) {
  return Container(
      height: 90,
      width: 90,
      child: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                  radius: 35,
                  backgroundColor: P.greycolor,
                  child: InkWell(
                      onTap: ontap,
                      child: Image.asset(
                        asset,
                        fit: BoxFit.fill,
                      ))),
              Text(text, style: P.textStyle(size: 15, color: P.blackcolor))
            ]),
      ));
}
