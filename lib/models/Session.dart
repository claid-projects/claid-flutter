import 'dart:core';

import 'package:claidflutter/models/LessonModel.dart';
class Session {
  int Order;
  String StartTime;
  String EndTime;
  String Title;
  LessonModel Program;

  Session(this.Order,this.Title, this.StartTime, this.EndTime);
}

