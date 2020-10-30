
import 'package:claidflutter/components/CardTimeLine.dart';
import 'package:claidflutter/components/InnerShadow.dart';
import 'package:claidflutter/components/square_button.dart';
import 'package:claidflutter/components/time_line.dart';
import 'package:claidflutter/models/ClassModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main/main_const.dart';

import 'package:timeline_tile/timeline_tile.dart';

class Home extends StatefulWidget {
  Home({Key key, this.onClick,this.classList}) : super(key: key);
  final VoidCallback onClick;
   List<ClassModel> classList=List<ClassModel>();

  @override
  _HomeState createState() => _HomeState(this.classList);
}

List<ClassModel> classList=List<ClassModel>();
class _HomeState extends State<Home> {
  _HomeState(List<ClassModel> classList) {


    setData();
  }
  int timeLineItem = 4;
  List<ClassModel> classList=List<ClassModel>();

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(

      body:Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.cyan[200],
                Colors.blue[500],
              ],
              stops: [0.0,0.9],
            ),
          ),
          constraints: BoxConstraints.expand(),
          child:Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Positioned(
                    top: 20,right: -150,
                    child: Container(
                      width: 300,
                      height: 300,

                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: RadialGradient(
                            colors: [
                              Colors.blue[500],
                              Colors.blue[300]

                            ]
                          )),
                    ),
                  ),




                   Container(
                margin: EdgeInsets.only(top:20,bottom: 20,left: 10,right: 10),
                height: MediaQuery.of(context).size.height*0.125,
               child:

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SquareButton(
                        label: "اعلان ها",
                        icon: Icon(Icons.notifications,), color1:Colors.green.shade500),
                    SquareButton(
                        label: "حضور و غیاب",
                        icon: Icon(Icons.account_box),color1:Colors.purple.shade500),
                    SquareButton(
                        label: "محتوا",
                        icon: Icon(Icons.content_paste),color1:Colors.pink.shade500),
                    SquareButton(
                        label: "تایم لاین",
                        icon: Icon(Icons.timeline),color1:Colors.amber.shade500)
                  ],

                ),
              )
                ],
              ),
              Container(
                  height: size.height-202,
                  decoration: new BoxDecoration(color: Colors.grey[50],
                      borderRadius: BorderRadius.only(topLeft:Radius.circular(30),topRight:Radius.circular(30)),
                      boxShadow: [BoxShadow(
                        color: Colors.cyan[600],
                        blurRadius: 5.0,
                      ),]
                  ),
                  child: ListView(

                    padding: const EdgeInsets.all(8),
                    children: <Widget>[

                      for (var i =0;i<classList.length;i++)
                        Container(child:TimeLine(classList[i]))
                    ],
                  )



              )

            ],


          )





      ),
    );
  }

  void setData() {
    //-----status = 1 : not started , status = 2 :starting , status = 3 :end
    ClassModel c1 = new  ClassModel (3, "8:00", "9:15", "https://www.roshd.ir/Portals/18/Images/jeld/oloom3.jpg", "علوم", ["امتحان فصل اول","نمره کلاسی"],Colors.green,"پایان فصل دوم");
    classList.add(c1);
    ClassModel c2 = new  ClassModel (3, "9:30", "10:45", "https://www.roshd.ir/Portals/18/Images/jeld/farsi03.jpg", "نگارش", ["انشا در مورد خانواده"],Colors.green,"پایان صفحه 37");
    classList.add(c2);
    ClassModel c3 = new  ClassModel (2, "11:00", "12:15", "https://www.roshd.ir/Portals/18/Images/jeld/ghoran3.jpg", "قرآن", ["روخوانی فصل اول",],Colors.blue,"پایان سوره عنکبوت");
    classList.add(c3);
    ClassModel c4 = new  ClassModel (1, "12:30", "13:45", "https://www.roshd.ir/Portals/18/Images/jeld/03-tarbiatbadani-1.jpg", "ورزش", [" تیم مدرسه","تست  جسمانی"],Colors.grey,"پایان نیم فصل");
    classList.add(c4);


  }
}
