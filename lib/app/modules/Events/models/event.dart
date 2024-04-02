import 'package:flutter/material.dart';

class Event {
  final String eventName;
  final String department;
  final String eventType;

  Event(this.eventName, this.department, this.eventType);
  String get title => eventName;
}
