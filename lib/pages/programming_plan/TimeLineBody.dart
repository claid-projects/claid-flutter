import 'package:claidflutter/components/time_line.dart';
import 'package:claidflutter/models/ClassModel.dart';
import 'package:claidflutter/models/LessonModel.dart';
import 'package:claidflutter/models/ProgramPlanDateModel.dart';
import 'package:claidflutter/models/ProgramPlanModel.dart';
import 'package:claidflutter/models/Session.dart';
import 'package:claidflutter/pages/home/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persian_date/persian_date.dart';

class TimeLineBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TimeLineBodyState();
  }
}

class TimeLineBodyState extends State<TimeLineBody> {



  List<ProgramPlanModel> programPlanList = List<ProgramPlanModel>();
  @override
  void initState() {
    super.initState();
    initData();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: programPlanList.length,
        child: new Scaffold(
          appBar: new PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: new Container(
              color: Colors.blue,
              child: new TabBar(
                tabs: [
                  for (var d = 0; d < programPlanList.length; d++)
                  Tab(text: programPlanList[d].Day.toString())

                ],
              ),
            ),
          ),
          body: TabBarView(children: [
//             any widget can work very well here <3
            for (var d = 0; d < programPlanList.length; d++)

              ListView(
                padding: const EdgeInsets.all(8),
                children: <Widget>[
                  for (var i = 0; i < programPlanList[d].ProgramPlanDateList.length; i++)
                    Container(child: TimeLine(programPlanList[d].ProgramPlanDateList[i]))
                ],
              )
          ]),
        ));
  }

  void initData() {
    //-----status = 1 : not started , status = 2 :starting , status = 3 :end
    LessonModel l1 =LessonModel("علوم","https://www.roshd.ir/Portals/18/Images/jeld/oloom3.jpg");
    LessonModel l2 =LessonModel("نگارش","https://www.roshd.ir/Portals/18/Images/jeld/farsi03.jpg");
    LessonModel l3 =LessonModel("قرآن","https://www.roshd.ir/Portals/18/Images/jeld/ghoran3.jpg");
    LessonModel l4 =LessonModel("ورزش","https://www.roshd.ir/Portals/18/Images/jeld/03-tarbiatbadani-1.jpg");
    LessonModel l5 =LessonModel("مطالعات","https://www.roshd.ir/Portals/18/Images/jeld/motaleate-ejtemaiee-03.jpg");
    LessonModel l6 =LessonModel("هدیه آسمانی","https://www.roshd.ir/Portals/18/Images/jeld/hedyehaye-aseman-03.jpg");
    LessonModel l7 =LessonModel("ریاضی","https://www.roshd.ir/Portals/18/Images/jeld/riyazi3.jpg");

    ProgramPlanModel c1 = new ProgramPlanModel(1,1,"شنبه",1,"انرژی اتمی", [ProgramPlanDateModel(3,"8:00","9:15",["امتحان فصل اول", "نمره کلاسی"],"پایان فصل دوم",l1),
      ProgramPlanDateModel(3,"9:30","10:45",["انشا در مورد خانواده"],"پایان صفحه 37",l2),
      ProgramPlanDateModel(2,"11:00","12:15",["روخوانی فصل اول"],"پایان سوره عنکبوت",l3),
      ProgramPlanDateModel(1,"12:30","13:45",[" تیم مدرسه", "تست  جسمانی"],"پایان نیم فصل",l4),
    ]

    );
    programPlanList.add(c1);


    ProgramPlanModel c2 = new ProgramPlanModel(1,2,"یکشنبه",1,"انرژی اتمی", [ProgramPlanDateModel(3,"8:00","9:15",["صورت و مخرج کسر"],"کسرها",l7),
      ProgramPlanDateModel(3,"9:30","10:45",["توضیح اشخاص با تقوا"],"مبحث تقوا",l6),
      ProgramPlanDateModel(2,"11:00","12:15",["توضیح ابزار","امتحان بخش یک"],"پایان بخش چهار از فصل دو",l5),
      ProgramPlanDateModel(1,"12:30","13:45",[],"پایان فصل",l1),
    ]

    );
    programPlanList.add(c2);

    ProgramPlanModel c3 = new ProgramPlanModel(1,3,"دوشنبه",1,"انرژی اتمی", [ProgramPlanDateModel(3,"8:00","9:15",["صورت و مخرج کسر"],"کسرها",l7),
      ProgramPlanDateModel(3,"9:30","10:45",["توضیح اشخاص با تقوا"],"مبحث تقوا",l6),
      ProgramPlanDateModel(2,"11:00","12:15",["توضیح ابزار","امتحان بخش یک"],"پایان بخش چهار از فصل دو",l5),
      ProgramPlanDateModel(1,"12:30","13:45",[],"پایان فصل",l1),
    ]

    );
    programPlanList.add(c3);

    ProgramPlanModel c4 = new ProgramPlanModel(1,4,"سه شنبه",1,"انرژی اتمی", [ProgramPlanDateModel(2,"11:00","12:15",["توضیح ابزار","امتحان بخش یک"],"پایان بخش چهار از فصل دو",l5),ProgramPlanDateModel(3,"8:00","9:15",["صورت و مخرج کسر"],"کسرها",l7),
      ProgramPlanDateModel(3,"9:30","10:45",["توضیح اشخاص با تقوا"],"مبحث تقوا",l6),

      ProgramPlanDateModel(1,"12:30","13:45",[],"پایان فصل",l1),
    ]

    );
    programPlanList.add(c4);

    ProgramPlanModel c5 = new ProgramPlanModel(1,5,"چهارشنبه",1,"انرژی اتمی", [
      ProgramPlanDateModel(3,"9:30","10:45",["توضیح اشخاص با تقوا"],"مبحث تقوا",l6),ProgramPlanDateModel(3,"8:00","9:15",["صورت و مخرج کسر"],"کسرها",l7),
      ProgramPlanDateModel(2,"11:00","12:15",["توضیح ابزار","امتحان بخش یک"],"پایان بخش چهار از فصل دو",l5),
      ProgramPlanDateModel(1,"12:30","13:45",[],"پایان فصل",l1),
    ]

    );
    programPlanList.add(c5);
  }
}
