import 'package:get/get.dart';

import '../controllers/addevents_controller.dart';

class AddeventsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddeventsController>(
      () => AddeventsController(),
    );
  }
}
