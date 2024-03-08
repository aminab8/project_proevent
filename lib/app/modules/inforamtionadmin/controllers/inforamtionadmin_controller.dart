import 'package:get/get.dart';

class InforamtionadminController extends GetxController {

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

  RxString email = ''.obs;
  RxString password = ''.obs;

  void setEmail(String value) => email.value = value;

  void setPassword(String value) => password.value = value;

  final count = 0.obs;

  void increment() => count.value++;

}
