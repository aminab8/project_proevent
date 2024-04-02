import '../models/event.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class EventsController extends GetxController {
  final focusedDay = DateTime.now().obs;
  final selectedDays = <DateTime>{}.obs; // Utilisez un Set pour stocker les dates sélectionnées
  final calendarFormat = CalendarFormat.month.obs;
  late final RxList<Event> selectedEvents = <Event>[].obs;// Utilisez RxList<Event> ici

  final TextEditingController eventController = TextEditingController();
  final Map<DateTime, List<Event>> events = {};

  @override
  void onInit() {
    super.onInit();
    // Initialisez selectedEvents avec une liste vide lors de l'initialisation du contrôleur
    //selectedEvents.value = getEventsForDay(selectedDay.value);
  }

  void showEventDialog() {
    String eventName = '';
    String department = '';
    String eventType = 'Conferences';
    Get.dialog(
      AlertDialog(
        scrollable: true,
        title: Text("Add Event"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Event Name',
                hintText: 'Enter the event name',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                eventName = value;
              },
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Department / Company Ensemble Name',
                hintText: 'Enter the department/company ensemble name',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                department = value;
              },
            ),
            SizedBox(height: 10),
            DropdownButtonFormField(
              items: [
                DropdownMenuItem(value: 'Conferences', child: Text("Conferences")),
                DropdownMenuItem(value: 'Reunions', child: Text("Réunions")),
                DropdownMenuItem(value: 'Seminaires', child: Text("Séminaires")),
                DropdownMenuItem(value: 'Soires de gala', child: Text("Soirés de gala")),
              ],
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
              value: eventType,
              onChanged: (value) {
                eventType = value.toString();
              },
            ),
          ],
        ),
        actions: [
          ElevatedButton(
          onPressed: () {
        // Ajouter votre logique pour ajouter l'événement avec les données saisies
        Event newEvent = Event(eventName, department, eventType);
          for (var selectedDay in selectedDays) {
         events.update(
          selectedDay,
            (value) => value..add(newEvent),
          ifAbsent: () => [newEvent],
       );
     }
     Get.back();
     for (var selectedDay in selectedDays) {
       selectedEvents.value.addAll(getEventsForDay(selectedDay));
    }
  },
    child: const Text("Add"),
    ),
        ],
      ),
    );

  }



  List<Event> getEventsForDay(DateTime day) {
    return events[day] ?? [];
  }

  void setCalendarFormat(CalendarFormat format) {
    calendarFormat.value = format;
  }

  void setFocusedDay(DateTime day) {
    focusedDay.value = day;
  }
}
