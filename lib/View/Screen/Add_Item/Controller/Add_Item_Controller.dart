import 'package:get/get.dart';

class AddItemController extends GetxController {
  var count = 0.obs;
  var totalcount = 0.obs;

  increaseCount() {
    count++;
    totalcount.value = count.value;
  }

  decreaseCount() {
    count--;
    totalcount.value = count.value;
  }
}
