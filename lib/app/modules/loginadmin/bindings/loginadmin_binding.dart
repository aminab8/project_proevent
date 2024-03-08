import 'package:get/get.dart';

import '../controllers/loginadmin_controller.dart';

class LoginadminBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginadminController>(
      () => LoginadminController(),
    );
  }
}
