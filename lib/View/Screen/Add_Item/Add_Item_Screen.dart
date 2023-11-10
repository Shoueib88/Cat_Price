import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cat_price/Const/Style.dart';
import 'package:cat_price/View/Price_List/controller/Price_List_Controller.dart';
import 'package:cat_price/View/widgets/default_form_filed.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Local_DataBase/Local_db.dart';

bool value = false;
final formkey = GlobalKey<FormState>();
aweSomeDialog(context, TextEditingController itemnamecontroller,
    TextEditingController price) {
  final control = Get.put(PriceListController());
  final dbController = Get.put(LocaldbController());
  return AwesomeDialog(
      width: 400,
      dialogType: DialogType.noHeader,
      context: context,
      body: Container(
          height: 450,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          P.sizeboxw20,
                          Text('Add Item',
                              style:
                                  P.textStyle(size: 20, color: P.blackcolor)),
                          IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: Icon(Icons.close, color: P.blackcolor))
                        ]),
                    Form(
                        key: formkey,
                        child: Column(
                          children: [
                            Column(children: [
                              Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Row(children: [
                                    Text('Item Name',
                                        style: P.textStyle(
                                            size: 18, color: P.blackcolor))
                                  ])),
                              Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 9),
                                  child: DefaultFormField(
                                      controller: itemnamecontroller,
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
                            ]),
                            Column(children: [
                              Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Row(children: [
                                    Text('Total Price',
                                        style: P.textStyle(
                                            size: 18, color: P.blackcolor))
                                  ])),
                              Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 9),
                                  child: DefaultFormField(
                                      controller: price,
                                      keyboardType: TextInputType.number,
                                      fieldBackgroundColor: P.greycolor,
                                      radius: 13,
                                      hintText: 'total price',
                                      validator: (val) {
                                        if (val!.isEmpty) {
                                          print('must not be empty');
                                        }
                                        return null;
                                      }))
                            ]),
                          ],
                        )),
                    P.sizwboxH20,
                    Column(children: [
                      Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(children: [
                            Text('UpLoad Image',
                                style:
                                    P.textStyle(size: 18, color: P.blackcolor))
                          ])),
                      Container(
                          decoration: P.boxdecoration(
                              colorborder: P.blackcolor, value: 13),
                          height: 130,
                          margin: const EdgeInsets.symmetric(horizontal: 9),
                          child: Center(
                              child: Container(
                                  child: GetX(
                                      init: PriceListController(),
                                      builder: (controller) {
                                        return Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                                width: 70,
                                                height: 70,
                                                child: controller
                                                        .images.value.isEmpty
                                                    ? Icon(
                                                        Icons
                                                            .camera_enhance_sharp,
                                                        size: 30)
                                                    : Image.file(File(controller
                                                        .images.value))),
                                            TextButton(
                                                onPressed: () {
                                                  controller.imagePicker();
                                                },
                                                child: Text('Add Image'))
                                          ],
                                        );
                                      }))))
                    ]),
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
                              dbController.insertDataBase(
                                  itemName: itemnamecontroller.text,
                                  price: price.text,
                                  image: control.images.value);
                            } else {
                              print('not valid');
                            }
                            Navigator.of(context).pop();
                          },
                          child: Text('Save',
                              style:
                                  P.textStyle(size: 20, color: P.whitecolor))),
                    )
                  ]),
            ),
          ))).show();
}
