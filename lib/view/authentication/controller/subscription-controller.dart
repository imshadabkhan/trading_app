import 'package:get/get.dart';

class SubscriptionController extends GetxController {
  RxInt selectedPlanIndex = 0.obs;
  RxInt selectedBrokerIndex = (-1).obs;

  void changePlan(int index) {
    selectedPlanIndex.value = index;
  }

  void changeBroker(int index) {
    selectedBrokerIndex.value = index;
  }
}
