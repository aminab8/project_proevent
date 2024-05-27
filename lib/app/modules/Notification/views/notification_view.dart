import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/notification_controller.dart';


class NotificationView extends StatelessWidget {
  final  NotificationController controller = Get.put(NotificationController());


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      //backgroundColor: Colors.deepPurple.shade100,
      body: Obx(() {
        if (controller.events.isEmpty) {
          return Center(child: Text("No events available"));
        } else {
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
                          Text(
                            "NameSession: ${event.namesession}",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),

                      trailing: GestureDetector(
                        onTap: () {
                         // controller.removeEvent(index);
                          controller.showUsernameModificationDialog(index);
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
        }
      },
    ),
    );
  }
  }
