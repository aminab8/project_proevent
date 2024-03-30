import 'package:get/get.dart';

import '../controllers/my_header_drawer_controller.dart';

class MyHeaderDrawerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyHeaderDrawerController>(
      () => MyHeaderDrawerController(),
    );
  }
}
