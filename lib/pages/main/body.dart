import 'package:claidflutter/pages/programming_plan/ProgrammingPlan.dart';
import 'package:claidflutter/pages/home/home.dart';
import 'package:claidflutter/pages/reports/reports.dart';

import 'package:claidflutter/pages/settings/settings.dart';
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

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  var curItemType = ItemType.home;
  var curGroup = 1;

  _MyHomePageState(DemoLocalizations localization) {
    this.localization = localization;
  }
  DemoLocalizations localization;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _itemBody(curItemType),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: _bottomItems(),
        onTap: _selectItem,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          _settingModalBottomSheet(context);
        },
        backgroundColor: kPrimaryColor,
        child: new Icon(Icons.play_arrow),
      ),
    );
  }

  List<BottomNavigationBarItem> _bottomItems() {
    return curGroup == 0
        ? []
        : [
            _bottomItem(ItemType.home),
            _bottomItem(ItemType.reports),
            _bottomItem(ItemType.programmingPlan),
            _bottomItem(ItemType.settings),
          ];
  }

  BottomNavigationBarItem _bottomItem(ItemType type) {
    return BottomNavigationBarItem(
      icon: Icon(
        BOTTOM_ICONS[type.index],
        color: _itemColor(type),
      ),
      title: Text(
        BOTTOM_TITLES[type.index],
        style: TextStyle(
          color: _itemColor(type),
        ),
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
        return ProgrammingPlan(onClick: _changeGroup);

      case ItemType.settings:
        return Settings(onClick: _changeGroup);

      default:
        return ProgrammingPlan(onClick: _changeGroup);
    }
  }

  Color _itemColor(type) {
    return curItemType == type ? BAR_BACK_COLORS[1] : Colors.grey;
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
                  title: new Text('شروع کلاس'),
                  onTap: () => {}),
              new ListTile(
                leading: new Icon(Icons.videocam),
                title: new Text('شروع کلاس جدید'),
                onTap: () => {},
              ),
              new ListTile(
                leading: new Icon(Icons.videocam),
                title: new Text('آیتم سوم'),
                onTap: () => {},
              ),
            ],
          ),
        );
      });
}

// bottomNavigationBar: FABBottomAppBar(
//   color: Colors.grey,
//   selectedColor: Colors.red,
//   notchedShape: CircularNotchedRectangle(),
//   onTabSelected: _selectedTab,
//   items: [
//     FABBottomAppBarItem(
//       iconData: Icons.settings,
//       text: this.localization.getTranslatedValue('settings'),
//     ),
//     FABBottomAppBarItem(
//       iconData: Icons.assignment,
//       text: this.localization.getTranslatedValue('reports'),
//     ),
//     FABBottomAppBarItem(
//       iconData: Icons.calendar_today,
//       text: this.localization.getTranslatedValue('programming plan'),
//     ),
//     FABBottomAppBarItem(
//       iconData: Icons.home,
//       text: this.localization.getTranslatedValue('home'),
//     ),
//   ],
// ),
