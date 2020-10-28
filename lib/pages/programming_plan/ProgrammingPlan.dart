import 'package:claidflutter/localization/demo_localization.dart';
import 'package:claidflutter/models/LessonModel.dart';
import 'package:claidflutter/models/ProgramPlanModel.dart';
import 'package:claidflutter/models/TimeModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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


List Saturday = ["زنگ اول شنبه","زنگ دوم شنبه","زنگ سوم شنبه","زنگ چهارم شنبه"];
 int saturday1 =1;
List Sunday = ["زنگ اول یکشنبه","زنگ دوم یکشنبه","زنگ سوم یکشنبه","زنگ چهارم یکشنبه"];
List Monday = ["زنگ اول دوشنبه","زنگ دوم دوشنبه","زنگ سوم دوشنبه","زنگ چهارم دوشنبه"];
List Tuesday = ["زنگ اول سه شنبه","زنگ دوم سه شنبه","زنگ سوم سه شنبه","زنگ چهارم سه شنبه"];
List Wednesday = ["زنگ اول چهارشنبه","زنگ دوم چهارشنبه","زنگ سوم چهارشنبه","زنگ چهارم چهارشنبه"];


class ProgrammingPlan extends StatefulWidget {

  ProgrammingPlan({Key key, this.onClick, this.pmm,this.localization,this.lessonItems}) : super(key: key);
  final VoidCallback onClick;
  final  ProgramPlanModel  pmm;
  final DemoLocalizations localization;
   List<LessonModel> lessonItems=List<LessonModel>();
  @override
  _ProgrammingPlanState createState() => _ProgrammingPlanState(this.pmm,this.localization,this.lessonItems);
}

class _ProgrammingPlanState extends State<ProgrammingPlan> {
  _ProgrammingPlanState( ProgramPlanModel  pmm,DemoLocalizations localization,List<LessonModel> lessonItems) {


    this.localization = localization;
      fechItems();
  }


  DemoLocalizations localization;
  List<LessonModel> lessonItems=List<LessonModel>();




  @override
  Widget build(BuildContext context) {

    return Directionality(

        textDirection: TextDirection.rtl, // set this property
        child:

        Container(
            margin: EdgeInsets.only(top: 30),
            child:DataTable(
          columns: const <DataColumn>[
            DataColumn(
              label: Text(
                'برنامه',
                style: TextStyle(fontStyle: FontStyle.italic, fontSize: 10),
              ),
            ),
            DataColumn(
              label: Text(
                '8:00',
                style: TextStyle(fontStyle: FontStyle.italic, fontSize: 10),
              ),
            ),
            DataColumn(
              label: Text(
                '9:15',
                style: TextStyle(fontStyle: FontStyle.italic, fontSize: 10),
              ),
            ),
            DataColumn(
              label: Text(
                '10:30',
                style: TextStyle(fontStyle: FontStyle.italic, fontSize: 10),
              ),
            ),
            DataColumn(
              label: Text(
                '11:45',
                style: TextStyle(fontStyle: FontStyle.italic, fontSize: 10),
              ),
            ),
          ],
          rows: <DataRow>[
            DataRow(
              cells: <DataCell>[
                DataCell(
                  Text('شنبه',
                      style: TextStyle(
                          fontStyle: FontStyle.italic, fontSize: 10)),
                ),
                DataCell(
                    Text(Saturday[0],
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 10)), onTap: () {

                  for (var i in lessonItems) {
                    i.Day = 1;
                    i.Ring=1;
                  }

                  showDialog(saturday1,lessonItems);
                }),
                DataCell(
                    Text(Saturday[1],
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 10)),
                    onTap: () {
                      for (var i in lessonItems) {
                        i.Day = 1;
                        i.Ring=2;
                      }
                      showDialog(saturday1,lessonItems);

                    }),
                DataCell(
                    Text(Saturday[2],
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 10)),
                    onTap: () {

                      for (var i in lessonItems) {
                        i.Day = 1;
                        i.Ring=3;
                      }
                      showDialog(saturday1,lessonItems);
                    }),
                DataCell(
                    Text(Saturday[3],
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 10)),
                    onTap: () {

                      for (var i in lessonItems) {
                        i.Day = 1;
                        i.Ring=4;
                      }
                      showDialog(saturday1,lessonItems);
                    }),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(
                  Text('یکشنبه',
                      style: TextStyle(
                          fontStyle: FontStyle.italic, fontSize: 10)),
                ),
                DataCell(
                    Text(Sunday[0],
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 10)),
                    onTap: () {
                      for (var i in lessonItems) {
                        i.Day = 2;
                        i.Ring=1;
                      }
                      showDialog(saturday1,lessonItems);

                    }),
                DataCell(
                    Text(Sunday[1],
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 10)),
                    onTap: () {
                      for (var i in lessonItems) {
                        i.Day = 2;
                        i.Ring=2;
                      }
                      showDialog(saturday1,lessonItems);
                    }),
                DataCell(
                    Text(Sunday[2],
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 10)),
                    onTap: () {
                      for (var i in lessonItems) {
                        i.Day = 2;
                        i.Ring=3;
                      }
                      showDialog(saturday1,lessonItems);
                    }),
                DataCell(
                    Text(Sunday[3],
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 10)),
                    onTap: () {
                      for (var i in lessonItems) {
                        i.Day = 2;
                        i.Ring=4;
                      }
                      showDialog(saturday1,lessonItems);
                    }),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text("دوشنبه",
                    style:
                    TextStyle(fontStyle: FontStyle.italic, fontSize: 10))),
                DataCell(
                    Text(Monday[0],
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 10)),
                    onTap: () {
                      for (var i in lessonItems) {
                        i.Day = 3;
                        i.Ring=1;
                      }
                      showDialog(saturday1,lessonItems);}),
                DataCell(
                    Text(Monday[1],
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 10)),
                    onTap: () {                      for (var i in lessonItems) {
                      i.Day = 3;
                      i.Ring=2;
                    }
                    showDialog(saturday1,lessonItems);}),
                DataCell(
                    Text(Monday[2],
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 10)),
                    onTap: () {
                      for (var i in lessonItems) {
                        i.Day = 3;
                        i.Ring=3;
                      }
                      showDialog(saturday1,lessonItems);
                    }),
                DataCell(
                    Text(Monday[3],
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 10)),
                    onTap: () {
                      for (var i in lessonItems) {
                        i.Day = 3;
                        i.Ring=4;
                      }
                      showDialog(saturday1,lessonItems);
                    }),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(
                  Text('سه شنبه',
                      style: TextStyle(
                          fontStyle: FontStyle.italic, fontSize: 10)),
                ),
                DataCell(
                    Text(Tuesday[0],
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 10)),
                    onTap: () {

                      for (var i in lessonItems) {
                        i.Day = 4;
                        i.Ring=1;
                      }
                      showDialog(saturday1,lessonItems);

                    }),
                DataCell(
                    Text(Tuesday[1],
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 10)),
                    onTap: () {                      for (var i in lessonItems) {
                      i.Day = 4;
                      i.Ring=2;
                    }
                    showDialog(saturday1,lessonItems);}),
                DataCell(
                    Text(Tuesday[2],
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 10)),
                    onTap: () {
                      for (var i in lessonItems) {
                        i.Day = 4;
                        i.Ring=3;
                      }
                      showDialog(saturday1,lessonItems);
                    }),
                DataCell(
                    Text(Tuesday[3],
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 10)),
                    onTap: () {
                      for (var i in lessonItems) {
                        i.Day = 4;
                        i.Ring=4;
                      }
                      showDialog(saturday1,lessonItems);
                    }),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(
                  Text('چهارشنبه',
                      style: TextStyle(
                          fontStyle: FontStyle.italic, fontSize: 10)),
                ),
                DataCell(
                    Text(Wednesday[0],
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 10)),
                    onTap: () {
                      for (var i in lessonItems) {
                        i.Day = 5;
                        i.Ring=1;
                      }
                      showDialog(saturday1,lessonItems);
                    }),
                DataCell(
                    Text(Wednesday[1],
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 10)),
                    onTap: () {
                      for (var i in lessonItems) {
                        i.Day = 5;
                        i.Ring=2;
                      }
                      showDialog(saturday1,lessonItems);
                    }),
                DataCell(
                    Text(Wednesday[2],
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 10)),
                    onTap: () {
                      for (var i in lessonItems) {
                        i.Day = 5;
                        i.Ring=3;
                      }
                      showDialog(saturday1,lessonItems);
                    }),
                DataCell(
                    Text(Wednesday[3],
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 10)),
                    onTap: () {
                      for (var i in lessonItems) {
                        i.Day = 5;
                        i.Ring=4;
                      }
                      showDialog(saturday1,lessonItems);
                    }),
              ],
            ),
          ],
        ))





    );
  }


  void showDialog(int saturday1,List<LessonModel>lessonItems) {

    showGeneralDialog(
      barrierLabel: "لیست دروس",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 700),
      context: context,
      pageBuilder: (_, __, ___) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: GridView.count(crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 15,

          children: List.generate(lessonItems.length, (int position){
            return generateItems(saturday1,context,lessonItems[position]);
          })
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

void fechItems(){


   LessonModel quran = new LessonModel("قرآن","https://www.roshd.ir/Portals/18/Images/jeld/ghoran3.jpg", "سوم دبستان",0,0);
   lessonItems.add(quran);
   LessonModel olom = new LessonModel("علوم","https://www.roshd.ir/Portals/18/Images/jeld/oloom3.jpg", "سوم دبستان",0,0);
   lessonItems.add(olom);
   LessonModel negaresh = new LessonModel("نگارش","https://www.roshd.ir/Portals/18/Images/jeld/farsi03.jpg", "سوم دبستان",0,0);
   lessonItems.add(negaresh);
   LessonModel dini = new LessonModel("هدیه های آسمانی","https://www.roshd.ir/Portals/18/Images/jeld/hedyehaye-aseman-03.jpg", "سوم دبستان",0,0);
   lessonItems.add(dini);
   LessonModel farsi = new LessonModel("فارسی","https://www.roshd.ir/Portals/18/Images/jeld/farsi03.jpg", "سوم دبستان",0,0);
   lessonItems.add(farsi);
   LessonModel varzesh = new LessonModel("ورزش","https://www.roshd.ir/Portals/18/Images/jeld/03-tarbiatbadani-1.jpg", "سوم دبستان",0,0);
   lessonItems.add(varzesh);
   LessonModel motaleat = new LessonModel("مطالعات","https://www.roshd.ir/Portals/18/Images/jeld/motaleate-ejtemaiee-03.jpg", "سوم دبستان",0,0);
   lessonItems.add(motaleat);
   LessonModel riyazi = new LessonModel("ریاضی","https://www.roshd.ir/Portals/18/Images/jeld/riyazi3.jpg", "سوم دبستان",0,0);
   lessonItems.add(riyazi);

}


  Card generateItems(int classTime,BuildContext context,LessonModel item){
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),

      ),
      elevation: 4,
      child:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InkWell(


                child:Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                        fit: BoxFit.fill,
                        image: new NetworkImage(
                            item.Image)
                    ),

                  ),

                ),
                onTap:(){

                  switch(classTime) {
                    case 1: {
                      setState(() {
                        Saturday[0]=item.Title;
                      });

                    }
                    break;

                    case 2: {
                      setState(() {
                        Saturday[1]=item.Title;
                      });

                    }
                    break;

                    default: {
                      Saturday[0]=item.Title;
                    }
                    break;
                  }


                  Navigator.of(context, rootNavigator: true).pop();
                }
            ),
            Text(item.Title),
            Text(item.Class)

          ],

        ),
      ),

    );
  }


}



