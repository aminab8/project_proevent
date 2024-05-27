

class Event {
final   int id;
  final  String name;
final String place;
final   DateTime date;
final String startTime;
final  String endTime;
final  int color;
final String namesession;



  Event( {
    required this.id,
    required this.name,
    required this.place,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.color,
    required this.namesession,




  });

  factory Event.fromJson(Map<String, dynamic> json) {


    return Event(
      id: json['id'],
      name: json['name'],
      place: json['place'],
      date: DateTime.parse(json['date']),
      startTime: json['startTime'],
      endTime: json['endTime'],
      color: json['color'],
      namesession: json['namesession'],





    );
  }
}