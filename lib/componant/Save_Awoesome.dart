import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cat_price/Const/Style.dart';
import 'package:cat_price/View/widgets/default_form_filed.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Local_DataBase/Local_db.dart';

final formkey = GlobalKey<FormState>();
saveAwoesome(context, TextEditingController listNameController) {
  final controller = Get.put(LocaldbController());
  return AwesomeDialog(
      dialogType: DialogType.noHeader,
      context: context,
      body: Container(
          child: Center(
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      P.sizeboxw20,
                      Text('Save List',
                          style: P.textStyle(size: 20, color: P.blackcolor)),
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(Icons.close, color: P.blackcolor))
                    ]),
                Form(
                    key: formkey,
                    child: Column(children: [
                      Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(children: [
                            Text('List Name',
                                style:
                                    P.textStyle(size: 18, color: P.blackcolor))
                          ])),
                      Container(
                          margin: const EdgeInsets.symmetric(horizontal: 9),
                          child: DefaultFormField(
                              controller: listNameController,
                              keyboardType: TextInputType.text,
                              fieldBackgroundColor: P.greycolor,
                              radius: 13,
                              hintText: 'item name',
                              validator: (val) {
                                if (val!.isEmpty) {
                                  print('must not be empty');
                                }
                                return null;
                              }))
                    ])),
                P.sizwboxH20,
                Container(
                  alignment: Alignment.center,
                  width: 290,
                  height: 50,
                  decoration: P.boxdecoration(
                      colorborder: P.primarycolor,
                      value: 13,
                      color: P.primarycolor),
                  child: MaterialButton(
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          Obx(() => controller.insertListName(
                              itemName: listNameController.text));
                        }
                      },
                      child: Text('Save',
                          style: P.textStyle(size: 20, color: P.whitecolor))),
                ),
                P.sizwboxH20
              ]),
        ),
      ))).show();
}
