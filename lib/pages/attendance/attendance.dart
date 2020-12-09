import 'package:claidflutter/components/counter.dart';
import 'package:claidflutter/components/square_button.dart';
import 'package:claidflutter/models/DetailStudentModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:persian_date/persian_date.dart';
import '../../constants.dart';

class CalenderAttendance extends StatefulWidget {

  @override
  _CalenderAttendanceState createState() => _CalenderAttendanceState();
}

class _CalenderAttendanceState extends State<CalenderAttendance> {
  Color containerColor = Colors.green;
  IconData icon = Icons.done;
  @override
  Widget build(BuildContext context) {
    var now = new DateTime.now();
    PersianDate getDate = PersianDate();

    Size size = MediaQuery.of(context).size;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child:NestedScrollView(
          headerSliverBuilder:(BuildContext context, bool innerBoxIsScrolled){
            return <Widget>[
              SliverAppBar(shape: ContinuousRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30))),
                expandedHeight: size.height*0.1,
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
                      child:
                      Row(
                        children: [
                          Spacer(),
                          Text(getDate.gregorianToJalali(now.toString(),"yyyy-m-d"),style: TextStyle(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          Spacer(),

                          Padding(
                            padding: const EdgeInsets.only(left:16.0),
                            child: Icon(Icons.save,color: kPrimaryColor,),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ];
          },
          body:
          ListView(
            shrinkWrap: true,
            children: <Widget>[
              Wrap(
                children: <Widget>[
                  for (int i = 0;i< detailStudents.length;i++)
                    Padding(
                      padding: const EdgeInsets.only(left:10.0,right: 10.0,top: 5,bottom: 5),
                      child: Card(

                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                        elevation: 4,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child:Container(
                                width: size.width*0.3,
                                height: size.height*0.145,
                                decoration: new BoxDecoration(
                                  borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20)),
                                  image: new DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(detailStudents[i].Url)),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top:32.0,bottom: 32.0),
                              child:
                              Column(
                                children: [
                                  Text(detailStudents[i].Name,style: TextStyle(fontSize: 20),),
                                  Row(
                                    children: <Widget>[

                                      Padding(
                                        padding: const EdgeInsets.only(left: 5,right: 5),
                                        child: Icon(Icons.check_circle,color: Colors.green,),
                                      ),
                                      Text("5"),

                                      Padding(
                                        padding: const EdgeInsets.only(left: 5,right: 5),
                                        child: Icon(Icons.remove_circle,color: Colors.red,),
                                      ),
                                      Text("6"),

                                    ],
                                  )
                                ],
                              ),
                            ),
                            Spacer(),
                            InkWell(

                              child: Container(
                                width: size.width*0.3,
                                height: size.height*0.15,
                                decoration: BoxDecoration(color:detailStudents[i].IsPresent == 1 ? Colors.green:detailStudents[i].IsPresent == 2 ? Colors.orange : Colors.red,borderRadius: BorderRadius.only(topLeft:Radius.circular(20),bottomLeft:Radius.circular(20))),
                                child: Icon(detailStudents[i].IsPresent == 1 ? Icons.done:
                                detailStudents[i].IsPresent == 2 ?
                                Icons.access_alarm:Icons.clear,color: Colors.white,size: 40,),
                              ),
                              onTap: ()=>{
                                setState(() {
                                  if (detailStudents[i].IsPresent == 1)
                                    {
                                      icon = Icons.access_alarm;
                                      containerColor = Colors.orange;
                                      detailStudents[i].IsPresent = 2;
                                    }
                                  else if (detailStudents[i].IsPresent == 2)
                                    {
                                      icon = Icons.clear;
                                      containerColor = Colors.red;
                                      detailStudents[i].IsPresent = 3;
                                    }
                                  else
                                    {
                                      icon = Icons.done;
                                      containerColor = Colors.green;
                                      detailStudents[i].IsPresent = 1;
                                    }

                                })

                              },
                            )
                          ],
                        ),
                      ),
                    )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
List<DetailStudentModel> detailStudents = [
  DetailStudentModel("پریسا نظری", "assets/student/1.jpg", 3,1),
  DetailStudentModel("نسرین حسن پور", "assets/student/2.jpg", 0,1),
  DetailStudentModel("فاطمه علوی", "assets/student/3.jpg", 0,2),
  DetailStudentModel("لیلا نجمی", "assets/student/4.jpg", 1,1),
  DetailStudentModel("غزل نصیری", "assets/student/5.jpg", 0,1),
  DetailStudentModel("شهرزاد بابکان", "assets/student/6.jpg", 5,2),
  DetailStudentModel("حمیده عسگری", "assets/student/7.jpg", 0,3),
  DetailStudentModel("نیلوفر هومایون فر", "assets/student/8.jpg", 2,1),
];
