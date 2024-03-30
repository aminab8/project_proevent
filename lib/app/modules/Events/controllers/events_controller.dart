import '../models/event.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class EventsController extends GetxController {
  final focusedDay = DateTime.now().obs;
  final selectedDay = DateTime.now().obs;
  final calendarFormat = CalendarFormat.month.obs;

  late final RxList<Event> selectedEvents = <Event>[].obs; // Utilisez RxList<Event> ici

  final TextEditingController eventController = TextEditingController();
  final Map<DateTime, List<Event>> events = {};

  @override
  void onInit() {
    super.onInit();
    // Initialisez selectedEvents avec une liste vide lors de l'initialisation du contrôleur
    selectedEvents.value = getEventsForDay(selectedDay.value);
  }

  void showEventDialog() {
    Get.dialog(
      AlertDialog(
        scrollable: true,
        title: Text("EventName"),
        content: Padding(
          padding: EdgeInsets.all(8),
          child: TextField(
            controller: eventController,
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              events.update(
                selectedDay.value,
                    (value) => value..add(Event(eventController.text)),
                ifAbsent: () => [Event(eventController.text)],
              );
              Get.back();
              selectedEvents.value = getEventsForDay(selectedDay.value);
            },
            child: Text("Submit"),
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
