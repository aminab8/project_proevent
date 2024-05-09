import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../data/services/databaseservice.dart';
import '../../../data/services/notifications.dart';

class NotificationController extends GetxController {
  var events = <Notifications>[].obs;
  var itemCount = 0.obs;
  @override
  void onInit() {
    super.onInit();
    fetchEvents();
  }

  Color getEventColor(int colorIndex) {
    switch (colorIndex) {
      case 0:
        return Colors.deepPurple;
      case 1:
        return Color(0xFF9BBBFC);
      case 2:
        return Color(0xFFF9CE69);
      default:
        return Colors.grey;
    }
  }

  void fetchEvents() async {
    var fetchedEvents = await DatabaseService.instance.getAllEvents();
    events.assignAll(fetchedEvents);
    print("Controller now has ${events.length} events");
  }
  void removeEvent(int index) {
    if (index < events.length) {
      var eventToRemove = events[index];


      DatabaseService.instance.deleteEvent(eventToRemove.id);


      events.removeAt(index);


      itemCount.value = events.length;
    }
  }
}
