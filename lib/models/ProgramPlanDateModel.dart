
import 'package:claidflutter/models/LessonModel.dart';

class ProgramPlanDateModel {

  int Status;
  String StartTime;
  String EndTime;
  List<String> Tags;
  String LessonSection;
  LessonModel Lesson;

  ProgramPlanDateModel(this.Status, this.StartTime, this.EndTime, this.Tags,
      this.LessonSection, this.Lesson);
}