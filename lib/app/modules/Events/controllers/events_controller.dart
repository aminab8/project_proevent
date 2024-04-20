
import 'package:get/get.dart';



class EventsController extends GetxController {
  final selectedDays = <DateTime>{}.obs;
  final focusedDay = DateTime.now().obs;


  @override
  void onInit() {
    super.onInit();
    // Initialisez selectedEvents avec une liste vide lors de l'initialisation du contrôleur
    //selectedEvents.value = getEventsForDay(selectedDay.value);
  }

}
class Event {
  final String eventName;
  final String department;
  final String eventType;

  Event(this.eventName, this.department, this.eventType);
  String get title => eventName;
}

