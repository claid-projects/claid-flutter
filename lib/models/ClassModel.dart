import 'dart:ui';

import 'package:claidflutter/models/Session.dart';

class ClassModel {
int status;
String start;
String end;
String url;
String bookName;
List<String> tags;
Color color;
String section;

ClassModel(this.status, this.start, this.end, this.url, this.bookName, this.tags,this.color,this.section);
}