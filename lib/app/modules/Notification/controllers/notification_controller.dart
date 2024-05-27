import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/services/databaseservice.dart';
import '../../../data/model/notifications.dart';

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
    print("Events: $events");
  }
  void removeEvent(int index) {
    if (index < events.length) {
      var eventToRemove = events[index];

      events.removeAt(index);

      itemCount.value = events.length;
    }
  }
  void showUsernameModificationDialog( int index) {
    Get.defaultDialog(
      title: "Are you sure to delete this event ?",
      titleStyle: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 20.0,
      ),
      content: Column(
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                onPressed: () {
                  Get.back();
                },
                child: Text("NO"),
              ),
              SizedBox(width: 30),
              ElevatedButton(
                onPressed: () {
                  events.removeAt(index);
                  Get.back();

                },
                child: Text("Yes"),
              ),
            ],
          ),
        ],
      ),
    );
  }



}
