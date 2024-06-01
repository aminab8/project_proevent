import 'package:get/get.dart';

class HomeController extends GetxController {
  void performSearch(String query) {
    // Implement your search logic here
    print('Search query: $query');
  }

  var eventList = <Event>[
    Event(id: 1, image: 'assets/images/image_event.jpg', rate: 4.5, name: '𝐏𝐫𝐨-𝐏𝐀𝐓'),
    Event(id: 2, image: 'assets/images/image_event1.jpg', rate: 4.0, name: '𝐜𝐞𝐫𝐭𝐢𝐟𝐢𝐜𝐚𝐭𝐢𝐨𝐧 𝐒𝐌𝐐'),
    Event(id: 3, image: 'assets/images/anniversaire1.jpg', rate: 4.0, name: 'Anniversaire ASM'),
    Event(id: 4, image: 'assets/images/jmi.jpg', rate: 4.0, name: 'JMI'),
    Event(id: 5, image: 'assets/images/1700578963637.jpg', rate: 4.0, name: 'team building'),
    Event(id: 6, image: 'assets/images/1706547940292.jpg', rate: 4.0, name: '𝐜𝐞𝐫𝐭𝐢𝐟𝐢𝐜𝐚𝐭𝐢𝐨𝐧 𝐈𝐒𝐎'),

  ].obs;

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}

class Event {
  final int id;
  final String image;
  final double rate;
  final String name;

  Event({
    required this.id,
    required this.image,
    required this.rate,
    required this.name,
  });
}
