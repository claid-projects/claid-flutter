import 'package:claidflutter/localization/demo_localization.dart';
import 'package:claidflutter/models/LessonModel.dart';
import 'package:claidflutter/models/ProgramPlanModel.dart';
import 'package:claidflutter/models/TimeModel.dart';
import 'package:claidflutter/pages/programming_plan/TimeTableBody.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'TimeLineBody.dart';

enum Lessons {
  Quran,
  Reiazi,
  Farsi,
  Motaleat,
  Dini1,
  Dini2,
  Dini3,
  Negaresh,
  Olom
}

class ProgrammingPlan extends StatefulWidget {
  ProgrammingPlan({Key key}) : super(key: key);

  @override
  _ProgrammingPlanState createState() => _ProgrammingPlanState();
}

class _ProgrammingPlanState extends State<ProgrammingPlan> {
  int _selectedTab = 0;

  List<Widget> childWidgets;

  @override
  void initState() {
    super.initState();
    childWidgets = [];

    childWidgets.add(
      Center(
        child: TimeTableBody(),
      ),
    );
    childWidgets.add(
      Center(
        child: TimeLineBody(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
            flexibleSpace: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: <Color>[
                        Colors.cyan[200],
                        Colors.blue[500],
                      ])),
            ),
            bottom: PreferredSize(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 12),
                  child: Row(
                    children: <Widget>[
                      SizedBox(width: 24),
                      Expanded(
                        child: CupertinoSegmentedControl(
                            children: const <int, Widget>{
                              0: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('جدول هفتگی')),
                              1: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('لیست هفتگی')),
                            },
                            groupValue: this._selectedTab,
                            onValueChanged: (value) {
                              setState(() {
                                this._selectedTab = value;
                              });
                            }),
                      ),
                      SizedBox(width: 24)
                    ],
                  ),
                ),
                preferredSize: Size(double.infinity, 48))),
        body: getChildWidget(),
    );
  }

  Widget getChildWidget() => childWidgets[_selectedTab];
}
