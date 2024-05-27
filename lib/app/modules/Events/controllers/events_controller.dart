
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:intl/intl.dart';

class EventsController extends GetxController {
  var selectedDay = DateTime.now().obs;
  var eventList = <Event>[
    Event(id: 1, image: 'assets/images/event_image_asm.jpg', rate: 4.5, name: '𝐏𝐫𝐨_𝐑𝐞𝐬𝐭𝐨'),
    Event(id: 2, image: 'assets/images/flutter_image.png', rate: 4.0, name: 'Formation Flutter'),
    Event(id: 3, image: 'assets/images/image_formation_asm.jpg', rate: 4.0, name: 'SAV'),

  ].obs;

  void onDateChange(DateTime date) {
    selectedDay.value = date;
  }

  String get formattedDate => DateFormat.yMMMMd().format(selectedDay.value);
}
void showUsernameModificationDialog() {
  Get.defaultDialog(
    title:  " Would you like to participate in our event ?",
    titleStyle: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 20.0,
    ),
    content: Column(
      children: [
        SizedBox(height: 10),
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
                Get.snackbar(
                  "Attend",
                  "Admin confirmation!",
                  snackPosition: SnackPosition.TOP,
                  backgroundColor: Colors.deepPurpleAccent.shade200,
                  colorText: Colors.white,
                );
              },
              child: Text("Yes"),
            ),
          ],
        ),
      ],
    ),
  );
}

class Event {
  final int id;
  final String image;
  final double rate;
  final String name; // Add this line

  Event({
    required this.id,
    required this.image,
    required this.rate,
    required this.name, // Add this line
  });
}
