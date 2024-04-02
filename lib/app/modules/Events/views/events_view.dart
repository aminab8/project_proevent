import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

import '../controllers/events_controller.dart';

class EventsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EventsController>(
      init: EventsController(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: Text("Table Calendar _Events"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: controller.showEventDialog,
          child: Icon(CupertinoIcons.add),
        ),
        body: Column(
          children: [
            Obx(
                  () => TableCalendar(
                firstDay: DateTime.utc(2010, 3, 14),
                lastDay: DateTime.utc(2030, 3, 14),
                focusedDay: controller.focusedDay.value,
                selectedDayPredicate: (day) => controller.selectedDays.contains(day),
                eventLoader: controller.getEventsForDay,
                calendarStyle: CalendarStyle(
                  outsideDaysVisible: false,
                ),
                onDaySelected: (selectedDay, focusedDay) {
                  controller.selectedDays.add(selectedDay); // Ajouter la date sélectionnée à la liste des dates sélectionnées
                  controller.setFocusedDay(focusedDay);
                },
                onFormatChanged: (format) {
                  controller.setCalendarFormat(format);
                },
                onPageChanged: (focusedDay) {
                  controller.setFocusedDay(focusedDay);
                },
              ),
            ),
            SizedBox(height: 8.0),
            Expanded(
              child: Obx(
                    () => ListView.builder(
                  itemCount: controller.selectedEvents.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        onTap: () => print(" "),
                        title: Text('${controller.selectedEvents[index].eventName}'),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }
}
