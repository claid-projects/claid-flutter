import 'dart:async';
import 'dart:ffi';

import 'package:claidflutter/components/CustmSwitch.dart';
import 'package:claidflutter/components/animTransition.dart';
import 'package:claidflutter/components/counter.dart';
import 'package:claidflutter/components/square_button.dart';
import 'package:claidflutter/models/DetailModel.dart';
import 'package:claidflutter/models/DetailStudentModel.dart';
import 'package:claidflutter/models/LessonModel.dart';
import 'package:claidflutter/models/ReminderModel.dart';
import 'package:claidflutter/models/Session.dart';
import 'package:claidflutter/pages/class_actions/reminder_insert.dart';
import 'package:claidflutter/pages/programming_plan/ProgrammingPlan.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'dart:async';
import 'package:jalali_calendar/jalali_calendar.dart';
import 'package:persian_date/persian_date.dart';
import '../../constants.dart';
import 'package:toggle_switch/toggle_switch.dart';
class ClassSelection extends StatefulWidget {
  LessonModel item;
  DetailModel detail;

  ClassSelection(this.item, this.detail);

  @override
  _ClassSelectionState createState() => _ClassSelectionState();
}

class _ClassSelectionState extends State<ClassSelection> {
  PersianDate persianDate = PersianDate(format: "yyyy/mm/dd  \n DD  , d  MM  ");
  DateTime selectedDate = DateTime.now();
  ScrollController _scrollController = new ScrollController();
  int _visable = 1;
  BuildContext context;

  @override
  void initState() {
    super.initState();
    print(
        "Parse TO Format ${persianDate.gregorianToJalali("2019-02-20T00:19:54.000Z", "yyyy-m-d hh:nn")}");
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
                expandedHeight: size.height * 0.25,
                floating: true,
                elevation: 0,
                pinned: true,
                backgroundColor: Colors.transparent,
                flexibleSpace: FlexibleSpaceBar(
                  background: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      elevation: 4,
                      child: Container(
                        width: size.width,
                        child: Column(
                          children: [
                            Row(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 8.0, right: 8.0, top: 8.0),
                                  child: Container(
                                    child: GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          width: size.width * 0.2,
                                          height: size.height * 0.1,
                                          decoration: new BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: new DecorationImage(
                                                fit: BoxFit.fill,
                                                image: new NetworkImage(
                                                    widget.item.Image)),
                                          ),
                                        )),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.item.Title,
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: Icon(
                                            Icons.import_contacts,
                                            color: kPrimaryLightColor,
                                          ),
                                        ),
                                        Text(
                                          "نیاز خانواده چگونه تامین میشود؟",
                                          style: TextStyle(
                                              color: kPrimaryColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8.0, right: 8.0),
                              child: Row(
                                children: [
                                  FlatButton(
                                    color: Colors.green,
                                    textColor: Colors.white,
                                    disabledColor: Colors.grey,
                                    disabledTextColor: Colors.black,
                                    padding: EdgeInsets.all(4.0),
                                    splashColor: Colors.green[900],
                                    onPressed: () {},
                                    child: Text(
                                      "جزئیات",
                                      style: TextStyle(fontSize: 14.0),
                                    ),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: TimeCounter(3600),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SliverAppBar(
                shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
                expandedHeight: size.height * 0.16,
                floating: true,
                elevation: 0,
                snap: true,
                pinned: false,
                backgroundColor: Colors.transparent,
                flexibleSpace: FlexibleSpaceBar(
                  background: Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      elevation: 4,
                      child: Container(
                        margin: EdgeInsets.only(
                            top: 16, bottom: 10, left: 20, right: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            InkWell(
                              onTap: () {},
                              child: SquareButton(
                                label: "تکلیف",
                                icon: Icon(
                                  Icons.border_color,
                                ),
                                color1: Colors.green.shade500,
                                opacity: 0.2,
                                offsetDX: 0,
                                offsetDY: 2,
                                onPressed: () => {},
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: SquareButton(
                                label: "ثبت یادآور",
                                icon: Icon(Icons.access_alarm),
                                color1: Colors.purple.shade500,
                                opacity: 0.2,
                                offsetDX: 0,
                                offsetDY: 2,
                                onPressed: () => {
                                  //  Navigator.of(context).push(animate())
                                  SchedulerBinding.instance
                                      .addPostFrameCallback((_) {
                                    _scrollController.animateTo(
                                      size.height * 0.25,
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.easeOut,
                                    );
                                  }),

                                  _settingModalBottomSheet(context, _visable)
                                },
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: SquareButton(
                                label: "یادداشت",
                                icon: Icon(Icons.note_add),
                                color1: Colors.pink.shade400,
                                opacity: 0.1,
                                offsetDX: 0,
                                offsetDY: 2,
                                onPressed: () => {},
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: SquareButton(
                                label: "امتحان کلاسی",
                                icon: Icon(Icons.assignment),
                                color1: Colors.amber.shade500,
                                opacity: 0.2,
                                offsetDX: 0,
                                offsetDY: 1,
                                onPressed: () => {},
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ];
          },
          body: ListView(
            shrinkWrap: true,
            children: <Widget>[
              GridView.count(
                shrinkWrap: true,
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: <Widget>[
                  for (DetailStudentModel item in detailStudents)
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      elevation: 4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: Container(
                              width: 100.0,
                              height: 100.0,
                              decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                                image: new DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(item.Url)),
                              ),
                            ),
                          ),
                          Text(item.Name),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, right: 8.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.check_circle,
                                  color: Colors.lightGreen,
                                  size: 30,
                                ),
                                Spacer(),
                                if (item.NotificationNumber != 0)
                                  Stack(
                                    children: [
                                      Icon(
                                        Icons.notifications,
                                        color: Colors.red,
                                        size: 30,
                                      ),
                                      Positioned(
                                        bottom: 8,
                                        left: 12,
                                        child: Text(
                                          item.NotificationNumber.toString(),
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      )
                                    ],
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _settingModalBottomSheet(context, int _visable) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30))),
        context: context,
        isScrollControlled: true,
        builder: (BuildContext bc) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.81,
              decoration: BoxDecoration(),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30)),
                          color: kPrimaryMediumColor,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, bottom: 8.0, right: 60, left: 60),
                          child: Text(
                            "ثبت یادآور",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.none),
                          ),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, right: 10.0, top: 10.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.25,
                      child: DefaultTabController(
                          length: 3,
                          child: Scaffold(
                            appBar: PreferredSize(
                              preferredSize: Size.fromHeight(50.0),
                              child: AppBar(
                                shape: ContinuousRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(55))),
                                backgroundColor: Color(0xFFfdeadf),
                                elevation: 0,
                                bottom: TabBar(
                                    unselectedLabelColor: Color(0xFFfaa476),
                                    indicatorSize: TabBarIndicatorSize.tab,
                                    indicator: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Color(0xFFfaa476),
                                    ),
                                    tabs: [
                                      Tab(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 16.0, right: 16.0),
                                          child: Row(
                                            children: [
                                              Icon(Icons.face),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 2.0),
                                                child: Text(
                                                  "دانش آموز",
                                                  style: (TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 11)),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Tab(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 16.0, right: 16.0),
                                          child: Row(
                                            children: [
                                              Icon(Icons.supervisor_account),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 4.0),
                                                child: Text(
                                                  "کلاس",
                                                  style: (TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Tab(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 16.0, right: 16.0),
                                          child: Row(
                                            children: [
                                              Icon(Icons.notifications),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 4.0),
                                                child: Text(
                                                  "عمومی",
                                                  style: (TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ]),
                              ),
                            ),
                            body: Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: TabBarView(children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 10.0, left: 10.0),
                                      child: InkWell(
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.1,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.1,
                                          decoration: new BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.black26),
                                          child: Icon(
                                            Icons.add,
                                            color: kPrimaryColor,
                                          ),
                                        ),
                                        onTap: () {
                                          setshowDialog(context);
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(5.0),
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height,
                                        width: 0.4,
                                        color: Colors.black54,
                                      ),
                                    ),
                                    if (reminder.students.length == 0)
                                    Padding(
                                      padding: const EdgeInsets.only(right:60.0),
                                      child: Text("دانش آموزی انتخاب نشده است",style: TextStyle(color: Colors.black26),),
                                    ),
                                    for (DetailStudentModel d
                                        in reminder.students)
                                      Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Column(
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.08,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.08,
                                              decoration: new BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: new DecorationImage(
                                                    fit: BoxFit.fill,
                                                    image: AssetImage(d.Url)),
                                              ),
                                            ),
                                            Text(d.Name)
                                          ],
                                        ),
                                      ),
                                  ],
                                ),
                                CustmSwitch(
                                    itemSwitch: [
                                      'تکلیف',
                                      'آزمون',
                                      'سایر'
                                    ],
                                    selectItem: kPrimaryMediumLightColor,
                                    unSelectItem: kPrimaryLightColor,
                                    onPressed: () {

                                    }),
                                Visibility(
                                    visible: false, child: Icon(Icons.games)),
                              ]),
                            ),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Container(
                        height: MediaQuery.of(context).size.height * 0.1,
                        child:Center(
                          child:
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ToggleSwitch(
                                minWidth: 90.0,
                                cornerRadius: 20,
                                activeBgColor: Colors.purple,
                                inactiveBgColor: Colors.purple[200],
                                labels: ['جلسه بعدی', 'جلسات آتی', 'تاریخ'],
                                onToggle: (index) {
                                    actionSwitchButton(index, context);
                                }),

                          ),
                        ),

                        //
                        // CustmSwitch(
                        //     itemSwitch: ['جلسه بعدی', 'جلسات آتی', 'تاریخ'],
                        //     selectItem: Colors.purple,
                        //     unSelectItem: Colors.purple[200],
                        //     onPressed: () {
                        //       _selectDate(context);
                        //
                        //     })

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: TextField(
                          minLines: 10,
                          maxLines: 15,
                          autocorrect: false,
                          decoration: InputDecoration(
                            hintText: 'توضیحات خود را وارد کنید',
                            filled: true,
                            fillColor: Colors.grey[200],
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28.0),
                    ),
                    color: Colors.orangeAccent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Add",
                        ),
                      ],
                    ),
                    onPressed: () {
                      _selectDate(context);
                    },
                  ),

                ],
              ),
            ),
          );
        });
  }


  void actionSwitchButton (int index,BuildContext context)
  {
    if (index == 2)
      _selectDate(context);
    if (index == 1)
      _startActivity();
  }


  Future _startActivity() async {

    Map results = await Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context){
      return new ProgrammingPlan();
    }));

    if (results != null && results.containsKey('item')) {
      setState(() {
        Session session  = results['item'];

      });
    }
  }
  void setshowDialog(context) {
    BuildContext _context = context;
    showDialog(
        context: _context,
        builder: (BuildContext _context) {
          return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              //this right here
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  Column(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30)),
                            color: kPrimaryMediumColor,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 8.0, bottom: 8.0, right: 60, left: 60),
                            child: Text(
                              "انتخاب دانش آموز",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.none),
                            ),
                          )),

                      GridView.count(
                        shrinkWrap: true,
                        primary: false,
                        padding: const EdgeInsets.all(20),
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        crossAxisCount: 2,
                        children: <Widget>[
                          for (DetailStudentModel item in detailStudents)
                            InkWell(
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                elevation: 4,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      child: Container(
                                        width: 100.0,
                                        height: 100.0,
                                        decoration: new BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: new DecorationImage(
                                              fit: BoxFit.fill,
                                              image: AssetImage(item.Url)),
                                        ),
                                      ),
                                    ),
                                    Text(item.Name),
                                  ],
                                ),
                              ),
                              onTap: () {
                                setState(() {
                                  DetailStudentModel dsm =
                                      new DetailStudentModel(
                                          item.Name,
                                          item.Url,
                                          item.NotificationNumber,
                                          item.IsPresent);
                                  reminder.students.add(dsm);
                                  Navigator.pop(_context);
                                  _settingModalBottomSheet(context, _visable);
                                });
                              },
                            ),
                        ],
                      )

                      // Wrap(
                      //   children: [
                      //   for (DetailStudentModel d in detailStudents)
                      //     Padding(
                      //       padding: const EdgeInsets.all(10.0),
                      //       child: Card(
                      //         shape: RoundedRectangleBorder(
                      //           borderRadius:
                      //           BorderRadius.all(Radius.circular(10)),
                      //         ),
                      //         elevation: 4,
                      //         child: Column(
                      //         children: [
                      //           Padding(
                      //             padding: const EdgeInsets.all(10),
                      //             child: Container(
                      //               width: MediaQuery.of(context)
                      //                   .size
                      //                   .width *
                      //                   0.1,
                      //               height: MediaQuery.of(context)
                      //                   .size
                      //                   .height *
                      //                   0.1,
                      //               decoration: new BoxDecoration(
                      //                 shape: BoxShape.circle,
                      //                 image: new DecorationImage(
                      //                     fit: BoxFit.fill,
                      //                     image: AssetImage(d.Url)),
                      //               ),
                      //             ),
                      //           ),
                      //
                      //           Padding(
                      //             padding: const EdgeInsets.all(8.0),
                      //             child: Text(d.Name),
                      //           )
                      //         ],
                      //       ),
                      //       ),
                      //     )
                      //
                      //   ],
                      // ),
                    ],
                  )
                ],
              ));
        });
  }

  Future _selectDate(BuildContext context) async {
    String picked = await jalaliCalendarPicker(
        context: context,
        convertToGregorian: false,
        showTimePicker: true,
        hore24Format: true);
    if (picked != null) setState(() => _value = picked);
  }
}

ReminderModel reminder = new ReminderModel([], 1);

List<DetailStudentModel> detailStudents = [
  DetailStudentModel("پریسا نظری", "assets/student/1.jpg", 3, 1),
  DetailStudentModel("نسرین حسن پور", "assets/student/2.jpg", 0, 1),
  DetailStudentModel("فاطمه علوی", "assets/student/3.jpg", 0, 1),
  DetailStudentModel("لیلا نجمی", "assets/student/4.jpg", 1, 2),
  DetailStudentModel("غزل نصیری", "assets/student/5.jpg", 0, 2),
  DetailStudentModel("شهرزاد بابکان", "assets/student/6.jpg", 5, 3),
  DetailStudentModel("حمیده عسگری", "assets/student/7.jpg", 0, 3),
  DetailStudentModel("نیلوفر هومایون فر", "assets/student/8.jpg", 2, 1),
];
