
import 'package:claidflutter/components/fab_bottom_app_bar.dart';
import 'package:claidflutter/models/LessonModel.dart';
import 'package:claidflutter/models/Session.dart';
import 'package:claidflutter/pages/programming_plan/ProgrammingPlan.dart';
import 'package:claidflutter/pages/home/home.dart';
import 'package:claidflutter/pages/reports/reports.dart';

import 'package:claidflutter/pages/settings/settings.dart';
import 'package:claidflutter/pages/topic_selection/lesson_selection.dart';
import 'package:flutter/material.dart';

import 'package:claidflutter/constants.dart';
import 'package:claidflutter/localization/demo_localization.dart';

import 'main_const.dart';

class MainBody extends StatelessWidget {



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(


        home: new MyHomePage(

            localization: DemoLocalizations.of(context)));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, this.localization}) : super(key: key);

  final String title;
  final DemoLocalizations localization;

  @override
  _MyHomePageState createState() => new _MyHomePageState(this.localization);
}

List<LessonModel> lessons;

List sessions = [
  Session(1, "زنگ اول", "08:00", "08:45"),
  Session(2, "زنگ دوم", "09:15", "10:00"),
  Session(3, "زنگ سوم", "10:30", "11:15"),
  Session(4, "زنگ چهارم", "11:45", "12:30")
];

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  var curItemType = ItemType.home;
  var curGroup = 1;

  _MyHomePageState(DemoLocalizations localization) {
    this.localization = localization;
  }

  DemoLocalizations localization;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadLessons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _itemBody(curItemType),

      bottomNavigationBar: FABBottomAppBar(

        color: Colors.grey,
        selectedColor: Colors.red,
        notchedShape: CircularNotchedRectangle(),
        onTabSelected:  _selectItem,
        items:
        [
          FABBottomAppBarItem(iconData: Icons.home, text: 'خانه'),
          FABBottomAppBarItem(iconData: Icons.assessment, text: 'گزارشات'),
          FABBottomAppBarItem(iconData: Icons.calendar_today, text: 'برنامه کلاسی'),
          FABBottomAppBarItem(iconData: Icons.settings, text: 'تنظیمات'),
        ],

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          _settingModalBottomSheet(context);
        },
        tooltip: 'Increment',

        backgroundColor: kPrimaryColor,
        elevation: 2.0,
        child: new Icon(Icons.play_arrow),
      ),
    );
  }

  Widget _itemBody(ItemType type) {
    switch (type) {
      case ItemType.home:
        return Home(onClick: _changeGroup);

      case ItemType.reports:
        return Reports(onClick: _changeGroup);

      case ItemType.programmingPlan:
        return ProgrammingPlan();

      case ItemType.settings:
        return Settings(onClick: _changeGroup);

      default:
        return ProgrammingPlan();
    }
  }

  void _changeGroup() {
    setState(() {
      curGroup = 1;
      curItemType = convertItemType(curItemType.index);
    });
  }

  void _selectItem(index) {
    setState(() {
      var cur = index;
      curItemType = convertItemType(cur);
    });
  }

  void showDialog(  List<LessonModel> lessonItems) {
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
                  return ListCard( context, lessonItems[position]);
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

  Card ListCard(  BuildContext context, LessonModel item) {
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
            Text("item.Class")
          ],
        ),
      ),
    );
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
          "مطالعات",
          "https://www.roshd.ir/Portals/18/Images/jeld/motaleate-ejtemaiee-03.jpg",
       ),
      LessonModel(
          "ریاضی",
          "https://www.roshd.ir/Portals/18/Images/jeld/riyazi3.jpg",
     )
    ];
  }
}

void _settingModalBottomSheet(context) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Container(
          child: new Wrap(
            children: <Widget>[
              new ListTile(
                  leading: new Icon(Icons.music_note),
                  title: new Text('درس بعدی'),
                  onTap: () => {}),
              new ListTile(
                leading: new Icon(Icons.videocam),
                title: new Text('شروع درس جدید'),
                onTap: () => {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LessonSelection()))
                },
              )
            ],
          ),
        );
      });
}


