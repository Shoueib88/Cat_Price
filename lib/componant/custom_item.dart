import 'dart:io';

import 'package:cat_price/Const/Style.dart';
import 'package:cat_price/View/Price_List/controller/Price_List_Controller.dart';
import 'package:cat_price/View/Screen/Add_Item/Controller/Add_Item_Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CustomItem extends StatelessWidget {
  Map pricelist;
  CustomItem({super.key, required this.pricelist});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PriceListController());
    final control = Get.put(AddItemController());
    return Container(
      width: 290,
      height: 100,
      decoration: P.boxdecoration(colorborder: P.greycolor!, value: 13),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          controller.images.value.isEmpty
              ? const SizedBox(width: 70, height: 80)
              : Container(
                  width: 70,
                  height: 80,
                  child: Image.file(
                    File(pricelist['image']),
                    fit: BoxFit.fill,
                  )),
          Container(
              width: 210,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(pricelist['itemName'],
                      style: P.textStyle(size: 17, color: P.blackcolor)),
                  Text((pricelist['price'] + ' \$'),
                      style: P.textStyle(size: 17, color: P.primarycolor)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Motherboard',
                          style: P.textStyle(size: 15, color: P.blackcolor)),
                      Container(
                          width: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  control.decreaseCount();
                                  print(control.count.value);
                                },
                                child: Container(
                                    height: 30,
                                    width: 30,
                                    padding: EdgeInsets.all(5),
                                    decoration: P.boxdecoration(
                                        colorborder: P.primarycolor, value: 2),
                                    child: Image.asset(
                                      'asset/icon/minimize.png',
                                      fit: BoxFit.fill,
                                    )),
                              ),
                              Obx(
                                () => Text(control.count.value.toString()),
                              ),
                              GestureDetector(
                                onTap: () {
                                  control.increaseCount();
                                  print(control.count.value);
                                },
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: P.boxdecoration(
                                      colorborder: P.primarycolor,
                                      value: 2,
                                      color: P.primarycolor),
                                  child: Center(
                                      child: Icon(
                                    Icons.add,
                                    color: P.whitecolor,
                                  )),
                                ),
                              ),
                            ],
                          ))
                    ],
                  )
                ],
              ))
        ],
      ),
    );
  }
}
