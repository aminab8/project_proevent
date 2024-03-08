import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:proevent_project/app/modules/loginemployee/views/loginemployee_view.dart';

import '../../../../model/employee.dart';

class RegistrationController extends GetxController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController idController = TextEditingController();

  RxString emailError = ''.obs;
  RxString passwordError = ''.obs;

  void handleRegistration() {
    // Assuming registration is successful and you have employee data
    Employee employee = Employee(
      username: usernameController.text,
      email: emailController.text,
      password: passwordController.text,
      id: idController.text,
    );

    // Additional actions after successful registration can be added here

    // Navigate to the LoginPage
    //Get.toNamed('/employee', arguments: employee);
Get.to(LoginemployeeView());
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
