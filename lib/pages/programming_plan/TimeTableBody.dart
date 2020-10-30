import 'package:claidflutter/models/LessonModel.dart';
import 'package:claidflutter/models/Session.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimeTableBody extends StatefulWidget {
  @override
  _TimeTableBodyState createState() => _TimeTableBodyState();
}

class _TimeTableBodyState extends State<TimeTableBody> {
  List days = [
    "شنبه",
    "یکشنبه",
    "دوشنبه",
    "سه شنبه",
    "چهارشنبه",
    "پنجشنبه",
    "جمعه"
  ];
  List sessions = [
    Session(1, "زنگ اول", "08:00", "08:45"),
    Session(2, "زنگ دوم", "09:15", "10:00"),
    Session(3, "زنگ سوم", "10:30", "11:15"),
    Session(4, "زنگ چهارم", "11:45", "12:30")
  ];

  List<LessonModel> lessons;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadLessons();
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
                      child: Icon(Icons.access_alarms,color: Colors.blue,)),
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
                for (var d = 0; d < days.length; d++)
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
                            child: Text(days[d],
                                style: TextStyle(
                                    fontStyle: FontStyle.italic, fontSize: 20)),
                          ),
                        ),
                      ),
                      for (var s = 0; s < sessions.length; s++)
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: OutlineButton(
                            color: Colors.blue,
                            textColor: Colors.blue,
                            onPressed: () {
                              showDialog(sessions[s].Order, lessons);
                            },
                            borderSide: BorderSide(
                              color: Colors.blue, //Color of the border
                              style: BorderStyle.solid, //Style of the border
                              width: 0.8, //width of the border
                            ),
                            child: Text(sessions[s].Title,
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
          "سوم دبستان",
          0,
          0),
      LessonModel(
          "علوم",
          "https://www.roshd.ir/Portals/18/Images/jeld/oloom3.jpg",
          "سوم دبستان",
          0,
          0),
      LessonModel(
          "نگارش",
          "https://www.roshd.ir/Portals/18/Images/jeld/farsi03.jpg",
          "سوم دبستان",
          0,
          0),
      LessonModel(
          "هدیه های آسمانی",
          "https://www.roshd.ir/Portals/18/Images/jeld/hedyehaye-aseman-03.jpg",
          "سوم دبستان",
          0,
          0),
      LessonModel(
          "فارسی",
          "https://www.roshd.ir/Portals/18/Images/jeld/farsi03.jpg",
          "سوم دبستان",
          0,
          0),
      LessonModel(
          "ورزش",
          "https://www.roshd.ir/Portals/18/Images/jeld/03-tarbiatbadani-1.jpg",
          "سوم دبستان",
          0,
          0),
      LessonModel(
          "مطالعات",
          "https://www.roshd.ir/Portals/18/Images/jeld/motaleate-ejtemaiee-03.jpg",
          "سوم دبستان",
          0,
          0),
      LessonModel(
          "ریاضی",
          "https://www.roshd.ir/Portals/18/Images/jeld/riyazi3.jpg",
          "سوم دبستان",
          0,
          0)
    ];
  }

  void showDialog(int day, List<LessonModel> lessonItems) {
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
              colors: [Colors.grey[200],Colors.white],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight
            )
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 15,
                children: List.generate(lessonItems.length, (int position) {
                  return ListCard(day, context, lessonItems[position]);
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

//
  Card ListCard(int classTime, BuildContext context, LessonModel item) {
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
            Text(item.Class)
          ],
        ),
      ),
    );
  }
}
