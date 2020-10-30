import 'package:claidflutter/components/time_line.dart';
import 'package:claidflutter/models/ClassModel.dart';
import 'package:claidflutter/models/Session.dart';
import 'package:claidflutter/pages/home/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimeLineBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TimeLineBodyState();
  }
}

class TimeLineBodyState extends State<TimeLineBody> {

  List days = [
    "شنبه",
    "1",
    "2",
    "3",
    "4",
    "5",
    "6"
  ];
  List sessions = [
    Session(1, "زنگ اول", "08:00", "08:45"),
    Session(2, "زنگ دوم", "09:15", "10:00"),
    Session(3, "زنگ سوم", "10:30", "11:15"),
    Session(4, "زنگ چهارم", "11:45", "12:30")
  ];
  List<ClassModel> classList = List<ClassModel>();
  @override
  void initState() {
    super.initState();
    initData();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: days.length,
        child: new Scaffold(
          appBar: new PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: new Container(
              color: Colors.blue,
              child: new TabBar(
                tabs: [
                  for (var d = 0; d < days.length; d++)
                  Tab(text: days[d],)

                ],
              ),
            ),
          ),
          body: TabBarView(children: [
//             any widget can work very well here <3
            for (var d = 0; d < days.length; d++)
              ListView(
                padding: const EdgeInsets.all(8),
                children: <Widget>[
                  for (var i = 0; i < classList.length; i++)
                    Container(child: TimeLine(classList[i]))
                ],
              )

          ]),
        ));
  }

  void initData() {
    //-----status = 1 : not started , status = 2 :starting , status = 3 :end
    ClassModel c1 = new ClassModel(
        3,
        "8:00",
        "9:15",
        "https://www.roshd.ir/Portals/18/Images/jeld/oloom3.jpg",
        "علوم",
        ["امتحان فصل اول", "نمره کلاسی"],
        Colors.green,
        "پایان فصل دوم");
    classList.add(c1);
    ClassModel c2 = new ClassModel(
        3,
        "9:30",
        "10:45",
        "https://www.roshd.ir/Portals/18/Images/jeld/farsi03.jpg",
        "نگارش",
        ["انشا در مورد خانواده"],
        Colors.green,
        "پایان صفحه 37");
    classList.add(c2);
    ClassModel c3 = new ClassModel(
        2,
        "11:00",
        "12:15",
        "https://www.roshd.ir/Portals/18/Images/jeld/ghoran3.jpg",
        "قرآن",
        [
          "روخوانی فصل اول",
        ],
        Colors.blue,
        "پایان سوره عنکبوت");
    classList.add(c3);
    ClassModel c4 = new ClassModel(
        1,
        "12:30",
        "13:45",
        "https://www.roshd.ir/Portals/18/Images/jeld/03-tarbiatbadani-1.jpg",
        "ورزش",
        [" تیم مدرسه", "تست  جسمانی"],
        Colors.grey,
        "پایان نیم فصل");
    classList.add(c4);
  }
}
