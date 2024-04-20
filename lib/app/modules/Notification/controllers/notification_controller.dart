import 'package:get/get.dart';
import 'package:proevent/app/data/db/db_helper.dart';
import 'package:proevent/app/data/model/notifications.dart';

class NotificationController extends GetxController {

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }
  Future<int> addEvent({Notifications? notifications}){
    return DBHelper.insert(notifications);

  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
