import 'package:cat_price/Const/Style.dart';
import 'package:cat_price/Const/assets.dart';
import 'package:cat_price/Local_DataBase/Local_db.dart';
import 'package:cat_price/View/Price_List/controller/Price_List_Controller.dart';
import 'package:cat_price/View/Screen/Add_Item/Add_Item_Screen.dart';
import 'package:cat_price/componant/Save_Awoesome.dart';
import 'package:cat_price/componant/TotalPrice_NumberItem.dart';
import 'package:cat_price/componant/custom_circleavatar.dart';
import 'package:cat_price/componant/custom_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(const PriceList());

class PriceList extends StatelessWidget {
  const PriceList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PriceListController());
    final dbcontroller = Get.put(LocaldbController());

    return Scaffold(
        appBar: AppBar(
          title: const Padding(
              padding: EdgeInsets.only(top: 30), child: Text('price list')),
          centerTitle: true,
        ),
        body: Center(
            child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                customCircle(ontap: () {}, asset: icons[0], text: 'Search'),
                customCircle(
                    ontap: () {
                      aweSomeDialog(
                          context, controller.itemName, controller.totalPrice);
                    },
                    asset: icons[1],
                    text: 'Add Item'),
                customCircle(ontap: () {}, asset: icons[2], text: 'My List'),
                customCircle(ontap: () {}, asset: icons[3], text: 'Share')
              ]),
              P.sizwboxH20,
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15.0),
                  height: 330.0,
                  child: Obx(() => ListView.separated(
                      itemCount: dbcontroller.PriceList.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(height: 8);
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return CustomItem(
                            pricelist: dbcontroller.PriceList[index]);
                      }))),
              P.sizwboxH20,
              TotalAndNumber(),
              P.sizwboxH20,
              Container(
                width: 370,
                height: 60,
                decoration: P.boxdecoration(
                    colorborder: P.primarycolor,
                    value: 13,
                    color: P.primarycolor),
                child: MaterialButton(
                    onPressed: () {
                      saveAwoesome(context, controller.listName);
                    },
                    child: Text('Save',
                        style: P.textStyle(size: 25, color: P.whitecolor))),
              )
            ],
          ),
        )));
  }
}
