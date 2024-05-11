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

  Notifications({
    this.name,
    this.date,
    this.color,
    this.id,
    this.endTime,
    this.namedept,
    this.place,
    this.startTime,
    this.type,
    this.isCompleted,
  });

  Notifications.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    place = json['place'];
    isCompleted = json['isCompleted'];
    date = json['date'];
    color = json ['color'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    namedept = json['namedept'];
    type = json['place'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic> ();
    data ['name'] = this.name;
    data ['namedept'] = this.namedept;
    data ['place'] = this.place;
    data ['id'] = this.id;
    data ['color'] = this.color;
    data ['type'] = this.type;
    data [' isCompleted'] = this.isCompleted;
    data [' date'] = this.date;
    data ['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    return data;
  }

  addevent({required Notifications notifications}) {}

}