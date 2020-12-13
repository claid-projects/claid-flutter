import 'package:claidflutter/components/CardTimeLine.dart';
import 'package:claidflutter/components/InnerShadow.dart';
import 'package:claidflutter/components/square_button.dart';
import 'package:claidflutter/components/time_line.dart';
import 'package:claidflutter/models/ClassModel.dart';
import 'package:claidflutter/models/LessonModel.dart';
import 'package:claidflutter/models/ProgramPlanDateModel.dart';
import 'package:claidflutter/models/ProgramPlanModel.dart';
import 'package:claidflutter/pages/attendance/attendance.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key, this.onClick}) : super(key: key);
  final VoidCallback onClick;


  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  _HomeState() {
    initData();
  }

  int timeLineItem = 4;
  List<ProgramPlanModel> programPlanList = List<ProgramPlanModel>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.cyan[200],
                Colors.blue[500],
              ],
              stops: [0.0, 0.9],
            ),
          ),
          constraints: BoxConstraints.expand(),
          child: SafeArea(
            child: Column(
              children: <Widget>[
                HomeHeaderAction(),

                Container(
                    height: size.height - 200,
                    decoration: new BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.cyan[600],
                            blurRadius: 5.0,
                          ),
                        ]),

                    child: ListView(
                      padding: const EdgeInsets.all(8),
                      children: <Widget>[
                        for (var i = 0; i < programPlanList[0].ProgramPlanDateList.length; i++)
                          Container(child: TimeLine(programPlanList[0].ProgramPlanDateList[i]))
                      ],
                    ))
              ],
            ),
          )),
    );
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

class HomeHeaderAction extends StatelessWidget {
  const HomeHeaderAction({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: 20,
          right: -150,
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                    colors: [Colors.blue[500], Colors.blue[300]])),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 16, bottom: 10, left: 10, right: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SquareButton(
                label: "اعلان ها",
                icon: Icon(
                  Icons.notifications,
                ),
                color1: Colors.green.shade500,
                opacity: 0.4,
                offsetDX: 0,
                offsetDY: 3,
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CalenderAttendance()),
                  )
                },
              ),
              SquareButton(
                label: "حضور و غیاب",
                icon: Icon(Icons.account_box),
                color1: Colors.purple.shade500,
                opacity: 0.4,
                offsetDX: 0,
                offsetDY: 3,
                onPressed: () => {

                },
              ),
              SquareButton(
                label: "محتوا",
                icon: Icon(Icons.content_paste),
                color1: Colors.pink.shade500,
                opacity: 0.4,
                offsetDX: 0,
                offsetDY: 3,
                onPressed: () => {

                },
              ),
              SquareButton(
                label: "تایم لاین",
                icon: Icon(Icons.timeline),
                color1: Colors.amber.shade500,
                opacity: 0.4,
                offsetDX: 0,
                offsetDY: 3,
                onPressed: () => {

                },
              )
            ],
          ),
        )
      ],
    );
  }
}
