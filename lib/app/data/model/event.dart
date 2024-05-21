import 'package:proevent/app/data/model/session.dart';

class Event {
  final int id;
  final String name;
  final String place;
  final DateTime date;
  final String startTime;
  final String endTime;
  final int color;
  late final List<Session> sessions;

  Event({
    required this.id,
    required this.name,
    required this.place,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.color,
    required this.sessions,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    final List<dynamic> sessionsJson = json['sessions'];
    final List<Session> sessions = sessionsJson.map((sessionJson) => Session.fromJson(sessionJson)).toList();

    return Event(
      id: json['id'],
      name: json['name'],
      place: json['place'],
      date: DateTime.parse(json['date']),
      startTime: json['startTime'],
      endTime: json['endTime'],
      color: json['color'],
      sessions: sessions,
    );
  }
}
