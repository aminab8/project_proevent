

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


class LoginController extends GetxController {

  var email = ''.obs;
  var password = ''.obs;
  var username = ''.obs;
  var isPasswordHidden = true.obs;

  late TextEditingController passwordController = TextEditingController();

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }


  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Entre your email!";
    } else if (!GetUtils.isEmail(value)) {
      return "The-email address entred is invalid";
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Entre your password!";
    } else if (value.length < 6) {
      return "Password should be at least 6 characters";
    } else if (value.length > 15) {
      return "Password should not exceed 15 characters";
    }
    return null;
  }

@override
  void onInit() {
    super.onInit();
    passwordController = TextEditingController();
  }



  void register() {

  }

  @override
  void onClose() {
    super.onClose();
    email.close();
    password.close();
    username.close();
   isPasswordHidden.close();
  }
}