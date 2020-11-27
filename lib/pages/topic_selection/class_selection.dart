import 'package:claidflutter/components/counter.dart';
import 'package:claidflutter/components/square_button.dart';
import 'package:claidflutter/models/DetailModel.dart';
import 'package:claidflutter/models/DetailStudentModel.dart';
import 'package:claidflutter/models/LessonModel.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class ClassSelection extends StatefulWidget {
  LessonModel item;
  DetailModel detail;

  ClassSelection(this.item, this.detail);

  @override
  _ClassSelectionState createState() => _ClassSelectionState();
}

class _ClassSelectionState extends State<ClassSelection> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child:

        NestedScrollView(
          headerSliverBuilder:(BuildContext context, bool innerBoxIsScrolled){
            return <Widget>[
              SliverAppBar(
                shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
                expandedHeight: size.height*0.25,
                floating: true,
                elevation: 0,
                pinned: true,
                backgroundColor: Colors.transparent,
                flexibleSpace: FlexibleSpaceBar(
                  background:Padding(
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
                                          padding: const EdgeInsets.only(left: 8.0),
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
                expandedHeight: size.height*0.16,
                floating: true,
                elevation: 0,
                snap: true,
                pinned: false,
                backgroundColor: Colors.transparent,
                flexibleSpace: FlexibleSpaceBar(

                  background:  Padding(
                    padding: const EdgeInsets.only(left:10.0,right:10.0),
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
                              onTap: (){},
                              child: SquareButton(
                                label: "تکلیف",
                                icon: Icon(Icons.border_color,),
                                color1: Colors.green.shade500,
                                opacity: 0.2,
                                offsetDX: 0,
                                offsetDY: 2,),
                            ),

                            InkWell(
                              onTap: (){},
                              child: SquareButton(
                                label: "ثبت یادآور",
                                icon: Icon(Icons.access_alarm),
                                color1: Colors.purple.shade500, opacity: 0.2,
                                offsetDX: 0,
                                offsetDY: 2,),
                            ),

                            InkWell(
                              onTap: (){},
                              child: SquareButton(
                                label: "یادداشت",
                                icon: Icon(Icons.note_add),
                                color1: Colors.pink.shade400, opacity: 0.1,
                                offsetDX: 0,
                                offsetDY: 2,),
                            ),

                            InkWell(
                              onTap: (){},
                              child: SquareButton(
                                label: "امتحان کلاسی",
                                icon: Icon(Icons.assignment),
                                color1: Colors.amber.shade500, opacity: 0.2,
                                offsetDX: 0,
                                offsetDY: 1,),
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
}

List<DetailStudentModel> detailStudents = [
  DetailStudentModel("پریسا نظری", "assets/student/1.jpg", 3),
  DetailStudentModel("نسرین حسن پور", "assets/student/2.jpg", 0),
  DetailStudentModel("فاطمه علوی", "assets/student/3.jpg", 0),
  DetailStudentModel("لیلا نجمی", "assets/student/4.jpg", 1),
  DetailStudentModel("غزل نصیری", "assets/student/5.jpg", 0),
  DetailStudentModel("شهرزاد بابکان", "assets/student/6.jpg", 5),
  DetailStudentModel("حمیده عسگری", "assets/student/7.jpg", 0),
  DetailStudentModel("نیلوفر هومایون فر", "assets/student/8.jpg", 2),
];
