import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Const/Style.dart';
import '../View/Price_List/controller/Price_List_Controller.dart';
import '../View/Screen/Add_Item/Controller/Add_Item_Controller.dart';

void main() => runApp(const TotalAndNumber());

class TotalAndNumber extends StatelessWidget {
  const TotalAndNumber({super.key});

  @override
  Widget build(BuildContext context) {
    final pricecontroller = Get.put(PriceListController());
    final itemcontroller = Get.put(AddItemController());
    return Container(
        decoration: P.boxdecoration(colorborder: P.greycolor!, value: 12),
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        margin: const EdgeInsets.symmetric(horizontal: 15.0),
        height: 80,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text('My Items', style: P.textStyle(color: P.blackcolor, size: 15)),
            Obx(() => Text(itemcontroller.totalcount.value.toString(),
                style: P.textStyle(color: P.blackcolor, size: 15)))
          ]),
          Container(
              width: 250, child: const Divider(height: 8, color: P.blackcolor)),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text('Total Price',
                style: P.textStyle(color: P.blackcolor, size: 15)),
            Text((pricecontroller.Total.toString()),
                style: P.textStyle(color: P.primarycolor, size: 15))
          ]),
        ]));
  }
}
