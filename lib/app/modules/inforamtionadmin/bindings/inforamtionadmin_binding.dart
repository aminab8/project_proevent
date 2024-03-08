import 'package:get/get.dart';

import '../controllers/inforamtionadmin_controller.dart';

class InforamtionadminBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InforamtionadminController>(
      () => InforamtionadminController(),
    );
  }
}
