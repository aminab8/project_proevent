import 'package:get/get.dart';
import 'package:proevent_project/app/modules/addevents/views/addevents_view.dart';
import 'package:proevent_project/app/modules/choose_page/views/choose_page_view.dart';

class SettingsController extends GetxController {
  void navigateToChoosePage() {
    Get.offAll(ChoosePageView());
  }

  void navigateToAddEventsPage() {
    Get.offAll(AddeventsView());
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
