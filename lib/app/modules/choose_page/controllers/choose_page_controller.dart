import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:proevent_project/app/modules/loginadmin/views/loginadmin_view.dart';
import 'package:proevent_project/app/modules/registration/views/registration_view.dart';

import '../../../../main.dart';


class ChoosePageController extends GetxController {
  void navigateToAdminPage() {
   // Get.offNamed('/admin');
    Get.to(LoginadminView());
  }

  void navigateToEmployeePage() {
    //Get.offNamed('/employee');
    Get.to(RegistrationView());
  }


  final count = 0.obs;
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

  void increment() => count.value++;
}
