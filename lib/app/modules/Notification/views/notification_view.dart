import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
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
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Department: ${event.namedept}",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "Place: ${event.place}",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "Date: ${event.date}",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "Start Time: ${event.startTime}",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "End Time: ${event.endTime}",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "Type: ${event.type}",
                          style: TextStyle(color: Colors.white),
                        ),
                        if (event.sessions.isNotEmpty)
                          ...event.sessions.map((session) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Session Name: ${session.name}",
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                "Session Number: ${session.number}",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          )),
                        if (event.formateurs.isNotEmpty)
                          ...event.formateurs.map((formateur) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Formateur Name: ${formateur.name}",
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                "Formateur Email: ${formateur.email}",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          )),
                      ],
                    ),
                    trailing: GestureDetector(
                      onTap: () {
                        controller.removeEvent(index);
                        controller.refresh();
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
