import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../controllers/notification_controller.dart';

class NotificationView extends StatelessWidget {
  final NotificationController controller = Get.put(NotificationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controller.events.isEmpty) {
          return Center(child: Text("No events available"));
        }

        return Center(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: ListView.builder(
              itemCount: controller.events.length,
              itemBuilder: (context, index) {
                var event = controller.events[index];
                var colorIndex = event.color ?? 0;
                var eventColor = controller.getEventColor(colorIndex);

                return Container(
                  color: eventColor,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        CupertinoIcons.calendar_badge_plus,
                        color: eventColor,
                      ),
                    ),
                    title: Text(
                      "Name: ${event.name}",
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      "Place: ${event.place}, Date: ${event.date}",
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: GestureDetector(
                      onTap: () {
                        controller.removeEvent(index);
                      },
                      child: Icon(
                        CupertinoIcons.trash,
                        color: Colors.red,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      }),
    );
  }
}
