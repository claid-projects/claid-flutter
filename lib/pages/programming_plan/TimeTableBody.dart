import 'package:claidflutter/models/LessonModel.dart';
import 'package:claidflutter/models/ProgramPlanDateModel.dart';
import 'package:claidflutter/models/ProgramPlanModel.dart';
import 'package:claidflutter/models/Session.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persian_date/persian_date.dart';

class TimeTableBody extends StatefulWidget {
  // --- type : 1 show dialog for select the lesson for program plan
  // --- type : 2 select lesson for rimander
  int type = 1;


  TimeTableBody(this.type);

  @override
  _TimeTableBodyState createState() => _TimeTableBodyState();
}

class _TimeTableBodyState extends State<TimeTableBody> {

  List sessions = [
    Session(1, "زنگ اول", "08:00", "08:45"),
    Session(2, "زنگ دوم", "09:15", "10:00"),
    Session(3, "زنگ سوم", "10:30", "11:15"),
    Session(4, "زنگ چهارم", "11:45", "12:30")
  ];

  List<LessonModel> lessons;
  List<ProgramPlanModel> programPlanList = List<ProgramPlanModel>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadLessons();
    initData();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Directionality(
        textDirection: TextDirection.rtl, // set this property
        child: Container(
            margin: EdgeInsets.only(top: 0),
            child: Table(
              border: TableBorder.symmetric(
                  inside: BorderSide(width: 1, color: Colors.grey[300]),
                  outside: BorderSide(width: 1, color: Colors.grey[400])),
              children: [
                TableRow(children: [
                  Container(
                      height: 50,
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.all(Radius.circular(1.0))),
                      child: Icon(
                        Icons.access_alarms,
                        color: Colors.blue,
                      )),
                  for (var i = 0; i < sessions.length; i++)
                    Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius:
                                BorderRadius.all(Radius.circular(1.0))),
                        child: Column(
                          children: [
                            Text(
                              sessions[i].StartTime,
                              style: TextStyle(
                                  fontStyle: FontStyle.normal, fontSize: 15),
                            ),
                            Text(
                              sessions[i].EndTime,
                              style: TextStyle(
                                  color: Colors.black38,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 15),
                            )
                          ],
                        ))
                ]),
                for (var d = 0; d < programPlanList.length; d++)
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4.0))),
                          child: Center(
                            child: Text(programPlanList[d].WeekDay,
                                style: TextStyle(
                                    fontStyle: FontStyle.italic, fontSize: 20)),
                          ),
                        ),
                      ),
                      for (var s = 0; s < programPlanList[d].ProgramPlanDateList.length; s++)
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: OutlineButton(
                            color: Colors.blue,
                            textColor: Colors.blue,
                            onPressed: () {
                              if (widget.type == 1)
                              showDialog(lessons);


                            },
                            borderSide: BorderSide(
                              color: Colors.blue, //Color of the border
                              style: BorderStyle.solid, //Style of the border
                              width: 0.8, //width of the border
                            ),
                            child: Text(programPlanList[d].ProgramPlanDateList[s].Lesson.Title,
                                style: TextStyle(
                                    fontStyle: FontStyle.italic, fontSize: 10)),
                          ),
                        ),
                    ],
                  ),
              ],
            )));
  }

  void loadLessons() {
    lessons = [
      LessonModel(
          "قرآن",
          "https://www.roshd.ir/Portals/18/Images/jeld/ghoran3.jpg",
       ),
      LessonModel(
          "علوم",
          "https://www.roshd.ir/Portals/18/Images/jeld/oloom3.jpg",
         ),
      LessonModel(
          "نگارش",
          "https://www.roshd.ir/Portals/18/Images/jeld/farsi03.jpg",
        ),
      LessonModel(
          "هدیه های آسمانی",
          "https://www.roshd.ir/Portals/18/Images/jeld/hedyehaye-aseman-03.jpg",
        ),
      LessonModel(
          "فارسی",
          "https://www.roshd.ir/Portals/18/Images/jeld/farsi03.jpg",
        ),
      LessonModel(
          "ورزش",
          "https://www.roshd.ir/Portals/18/Images/jeld/03-tarbiatbadani-1.jpg",
        ),
      LessonModel(
          "مطالعات اجتماعی",
          "https://www.roshd.ir/Portals/18/Images/jeld/motaleate-ejtemaiee-03.jpg",
         ),
      LessonModel(
          "ریاضی",
          "https://www.roshd.ir/Portals/18/Images/jeld/riyazi3.jpg",
         )
    ];
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

  void showDialog(List<LessonModel> lessonItems) {
    showGeneralDialog(
      barrierLabel: "لیست دروس",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 400),
      context: context,
      pageBuilder: (_, __, ___) {
        return Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.grey[200], Colors.white],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 15,
                children: List.generate(lessonItems.length, (int position) {
                  return ListCard(context, lessonItems[position]);
                })),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        return SlideTransition(
          position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
          child: child,
        );
      },
    );
  }

  Card ListCard(BuildContext context, LessonModel item) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      elevation: 4,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InkWell(
                child: Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                        fit: BoxFit.fill, image: new NetworkImage(item.Image)),
                  ),
                ),
                onTap: () {}),
            Text(item.Title),
            Text("سوم دبستان")
          ],
        ),
      ),
    );
  }
}
