import 'package:get/get.dart';

// TabController to manage the selected index using GetX
class NavigationbarTabController extends GetxController {
  var selectedIndex = 0.obs;

  // Method to change tab
  void changeTab(int index) {
    selectedIndex.value = index;
  }
}
