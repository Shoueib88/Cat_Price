import 'package:cat_price/Const/Style.dart';
import 'package:cat_price/View/Price_List/Price_List_Screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            appBarTheme: AppBarTheme(
                color: Colors.transparent,
                elevation: 0.0,
                titleTextStyle: P.textStyle(color: P.blackcolor, size: 25)),
            colorScheme: ColorScheme.fromSeed(seedColor: P.primarycolor)),
        home: PriceList());
  }
}
