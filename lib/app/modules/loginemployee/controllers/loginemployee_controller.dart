import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:proevent_project/app/modules/homeemployee/views/homeemployee_view.dart';

import '../../../../model/employee.dart';

class LoginemployeeController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  RxString emailError = ''.obs;
  RxString passwordError = ''.obs;


  void login() {
    Employee employee = Employee(
      username: usernameController.text,
      email: emailController.text,
      password: passwordController.text,
      id: "10",
    );
   // Get.offNamed('/home', arguments: employee);
    Get.to(HomeemployeeView());
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
