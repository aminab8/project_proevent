

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
  String? namesession;





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
    this.namesession,


  });

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
    namesession = json['namesession'];



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
    data['namesession'] = this.namesession;

    return data;
  }


}