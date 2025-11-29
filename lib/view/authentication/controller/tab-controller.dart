import 'package:get/get.dart';

class MarketTabController extends GetxController {
  RxBool isForex = true.obs;

  void changeToForex() {
    isForex.value = true;
  }

  void changeToCrypto() {
    isForex.value = false;
  }
}
