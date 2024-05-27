class NotificationItem {
  int? id;
  String title;
  String body;
  int eventId;

  NotificationItem({
    this.id,
    required this.title,
    required this.body,
    required this.eventId,
  });

  factory NotificationItem.fromJson(Map<String, dynamic> json) {
    return NotificationItem(
      id: json['id'],
      title: json['title'],
      body: json['body'],
      eventId: json['eventId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'body': body,
      'eventId': eventId,
    };
  }
}
