import 'package:claidflutter/pages/programming_plan/ProgrammingPlan.dart';

import 'ProgramPlanDateModel.dart';
import 'TimeModel.dart';

class ProgramPlanModel {
  int ProgrammingPlanId;
  int Day;
  String WeekDay;
  int SchoolId;
  String SchoolTitle;
  List<ProgramPlanDateModel> ProgramPlanDateList;


  ProgramPlanModel(
      this.ProgrammingPlanId,
      this.Day,
      this.WeekDay,
      this.SchoolId,
      this.SchoolTitle,
      this.ProgramPlanDateList
 );

// int day;
  // List<TimeModel> time;
  //
  // ProgramPlanModel(this.day, this.time);
}
