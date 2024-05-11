import 'package:get/get.dart';

class BottomNavigationBarController extends GetxController {
  var tabIndex = 0;
  var email = ''.obs;


  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }


  @override
  void onInit() {
    super.onInit();

  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
