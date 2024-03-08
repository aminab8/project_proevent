import 'package:get/get.dart';

import '../controllers/homeemployee_controller.dart';

class HomeemployeeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeemployeeController>(
      () => HomeemployeeController(),
    );
  }
}
