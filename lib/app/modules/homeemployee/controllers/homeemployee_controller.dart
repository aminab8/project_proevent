import 'package:get/get.dart';
import 'package:proevent_project/app/modules/choose_page/views/choose_page_view.dart';
import 'package:proevent_project/app/modules/settings/views/settings_view.dart';

import '../../../../model/employee.dart';

class HomeemployeeController extends GetxController {
  Employee? employee;
  void onInit() {
    //Extract the passed employee data when the page is created
    employee = Get.arguments as Employee?;
    super.onInit();
  }

  void navigateToChoosePage() {
    Get.offAll(ChoosePageView());
  }

  void navigateToSettingsPage() {
    Get.offAll(SettingsView());
  }

  final count = 0.obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
