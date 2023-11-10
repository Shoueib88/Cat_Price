import 'package:cat_price/Local_DataBase/Local_db.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PriceListController extends GetxController {
  TextEditingController itemName = TextEditingController();
  TextEditingController totalPrice = TextEditingController();
  TextEditingController listName = TextEditingController();
  final _image_picker = ImagePicker();
  var images = ''.obs;

  var MyItem = 0;
  var Total = 0;
  var localdb = LocaldbController();

  @override
  void onInit() {
    localdb.createDataBase();
    super.onInit();
  }

  imagePicker() async {
    var image = await _image_picker.pickImage(source: ImageSource.camera);
    if (image != null) images.value = image.path;
  }
}
