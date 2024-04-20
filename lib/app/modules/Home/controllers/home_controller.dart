import 'package:get/get.dart';
import 'package:proevent/app/data/services/notification_services.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  var notifyHelper;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
     notifyHelper = NotifyHelper();
    notifyHelper.requestIOSPermissions();
    notifyHelper.initializeNotification();
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
