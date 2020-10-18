import 'package:claidflutter/localization/demo_localization.dart';
import 'package:claidflutter/models/ProgramPlanModel.dart';
import 'package:claidflutter/models/TimeModel.dart';
import 'package:flutter/material.dart';

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


List classBells = ["زنگ اول شنبه","زنگ دوم شنبه","زنگ سوم شنبه","زنگ چهارم شنبه"];

class ProgrammingPlan extends StatefulWidget {
  ProgrammingPlan({Key key, this.onClick, this.pmm,this.localization}) : super(key: key);
  final VoidCallback onClick;
  final  ProgramPlanModel  pmm;
  final DemoLocalizations localization;
  @override
  _ProgrammingPlanState createState() => _ProgrammingPlanState(this.pmm,this.localization);
}

class _ProgrammingPlanState extends State<ProgrammingPlan> {
  _ProgrammingPlanState( ProgramPlanModel  pmm,DemoLocalizations localization) {
    this.pmm = pmm;
    this.localization = localization;
  }


  ProgramPlanModel  pmm ;
  DemoLocalizations localization;




  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Directionality(
      // add this
        textDirection: TextDirection.rtl, // set this property
        child: DataTable(
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
                    onTap: () {}),
                DataCell(
                    Text(classBells[0],
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 10)), onTap: () {



                  TimeModel tm = new TimeModel("8:00", "9:15", "");
                  List<TimeModel> ltm = new List<TimeModel>();
                  ltm.add(tm);
                  ProgramPlanModel programPlan = new ProgramPlanModel(1,ltm);
                  pmm=programPlan;
                  showDialog(pmm);
                }),
                DataCell(
                    Text('زنگ دوم شنبه',
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 10)),
                    onTap: () {}),
                DataCell(
                    Text('انتخاب',
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 10)),
                    onTap: () {}),
                DataCell(
                    Text('انتخاب',
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 10)),
                    onTap: () {}),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(
                    Text('یکشنبه',
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 10)),
                    onTap: () {}),
                DataCell(
                    Text('انتخاب',
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 10)),
                    onTap: () {}),
                DataCell(
                    Text('انتخاب',
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 10)),
                    onTap: () {}),
                DataCell(
                    Text('انتخاب',
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 10)),
                    onTap: () {}),
                DataCell(
                    Text('انتخاب',
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 10)),
                    onTap: () {}),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('دوشنبه',
                    style:
                    TextStyle(fontStyle: FontStyle.italic, fontSize: 10))),
                DataCell(
                    Text('انتخاب',
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 10)),
                    onTap: () {}),
                DataCell(
                    Text('انتخاب',
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 10)),
                    onTap: () {}),
                DataCell(
                    Text('انتخاب',
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 10)),
                    onTap: () {}),
                DataCell(
                    Text('انتخاب',
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 10)),
                    onTap: () {}),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(
                    Text('سه شنبه',
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 10)),
                    onTap: () {}),
                DataCell(
                    Text('انتخاب',
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 10)),
                    onTap: () {}),
                DataCell(
                    Text('انتخاب',
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 10)),
                    onTap: () {}),
                DataCell(
                    Text('انتخاب',
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 10)),
                    onTap: () {}),
                DataCell(
                    Text('انتخاب',
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 10)),
                    onTap: () {}),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(
                    Text('چهارشنبه',
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 10)),
                    onTap: () {}),
                DataCell(
                    Text('انتخاب',
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 10)),
                    onTap: () {}),
                DataCell(
                    Text('انتخاب',
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 10)),
                    onTap: () {}),
                DataCell(
                    Text('انتخاب',
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 10)),
                    onTap: () {}),
                DataCell(
                    Text('انتخاب',
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 10)),
                    onTap: () {}),
              ],
            ),
          ],
        ));
  }


  void showDialog( ProgramPlanModel  pmm) {

    showGeneralDialog(
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 700),
      context: context,
      pageBuilder: (_, __, ___) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 300,
            child:  Column(
                children: <Widget>[
                  Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: ExactAssetImage('assets/books/quran.png'),

                        ),
                        Text("قرآن",style: TextStyle(color: Colors.black45,fontFamily: "IranSans"),)

                      ])
                ]
            ),
            margin: EdgeInsets.only(bottom: 50, left: 12, right: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
            ),
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



}


