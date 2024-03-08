import 'package:get/get.dart';

import '../controllers/loginemployee_controller.dart';

class LoginemployeeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginemployeeController>(
      () => LoginemployeeController(),
    );
  }

}
