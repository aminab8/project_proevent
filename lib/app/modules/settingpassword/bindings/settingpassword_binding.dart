import 'package:get/get.dart';

import '../controllers/settingpassword_controller.dart';

class SettingpasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingpasswordController>(
      () => SettingpasswordController(),
    );
  }
}
