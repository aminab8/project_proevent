import 'package:proevent/app/data/model/formateur.dart';
import '../model/session.dart';

class Notifications {
  int? id;
  int? isCompleted;
  String? name;
  String? namedept;
  String? place;
  String? date;
  String? startTime;
  String? endTime;
  int? color;
  String? type;

  List<Session> sessions = [];
  List<Formateur> formateurs = [];

  Notifications({
    this.id,
    this.isCompleted,
    this.name,
    this.namedept,
    this.place,
    this.date,
    this.startTime,
    this.endTime,
    this.color,
    this.type,
    List<Session>? sessions,
    List<Formateur>? formateurs,
  }) {
    this.sessions = sessions ?? [];
    this.formateurs = formateurs ?? [];
  }

  Notifications.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    place = json['place'];
    isCompleted = json['isCompleted'];
    date = json['date'];
    color = json['color'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    namedept = json['namedept'];
    type = json['type'];
    sessions = (json['sessions'] as List<dynamic>?)
        ?.map((e) => Session.fromJson(e))
        .toList() ??
        [];
    formateurs = (json['formateurs'] as List<dynamic>?)
        ?.map((e) => Formateur.fromJson(e))
        .toList() ??
        [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['isCompleted'] = this.isCompleted;
    data['name'] = this.name;
    data['namedept'] = this.namedept;
    data['place'] = this.place;
    data['date'] = this.date;
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    data['color'] = this.color;
    data['type'] = this.type;
    data['sessions'] = this.sessions.map((e) => e.toJson()).toList();
    data['formateurs'] = this.formateurs.map((e) => e.toJson()).toList();
    return data;
  }

  void addSession(Session session) {
    sessions.add(session);
  }

  void addFormateur(Formateur formateur) {
    formateurs.add(formateur);
  }
}
