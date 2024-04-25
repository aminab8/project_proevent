

import 'package:get/get.dart';


class LoginController extends GetxController {
  var isPasswordHidden = true.obs;
  // FirebaseAuth  login =  FirebaseAuth.instance;
  //
  // void forgetPassword(String email){
  //   login.sendPasswordResetEmail(email:email).then((value){
  //     Get.back();
  //     Get.snackbar('EmailSent', 'we have sent password rest email');
  //   }).catchError((e){
  //     print("Error is sending password rest email is $e");
  //   });
  // }

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "* Required";
    } else if (!GetUtils.isEmail(value)) {
      return "Invalid email format";
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "* Required";
    } else if (value.length < 6) {
      return "Password should be at least 6 characters";
    } else if (value.length > 15) {
      return "Password should not exceed 15 characters";
    }
    return null;
  }


}
