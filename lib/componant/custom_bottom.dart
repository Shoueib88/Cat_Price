import 'package:flutter/material.dart';

import '../Const/Style.dart';

saveBottom(TextEditingController itemnamecontroller,
    TextEditingController totalpricecontroller, void Function() onPressed) {
  return (itemnamecontroller.text.isEmpty && totalpricecontroller.text.isEmpty)
      ? Container(
          width: 290,
          height: 50,
          decoration: P.boxdecoration(
              colorborder: P.greycolor!, value: 13, color: P.greycolor),
          child:
              Text('Save', style: P.textStyle(size: 20, color: P.whitecolor)),
        )
      : Container(
          alignment: Alignment.center,
          width: 290,
          height: 50,
          decoration: P.boxdecoration(
              colorborder: P.primarycolor, value: 13, color: P.primarycolor),
          child: MaterialButton(
              onPressed: onPressed,
              child: Text('Save',
                  style: P.textStyle(size: 20, color: P.whitecolor))),
        );
}
