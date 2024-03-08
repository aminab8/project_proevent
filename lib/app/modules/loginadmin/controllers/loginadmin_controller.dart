import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:proevent_project/app/modules/inforamtionadmin/controllers/inforamtionadmin_controller.dart';
import 'package:proevent_project/app/modules/inforamtionadmin/views/inforamtionadmin_view.dart';

class LoginadminController extends GetxController {
  final passwordController = TextEditingController();
  final emailController = TextEditingController();


  void login() {
    Get.to(
      InforamtionadminView(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
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
