
import 'package:claidflutter/components/CardTimeLine.dart';
import 'package:claidflutter/components/InnerShadow.dart';
import 'package:claidflutter/components/square_button.dart';
import 'package:claidflutter/components/time_line.dart';
import 'package:flutter/material.dart';

import '../main/main_const.dart';

import 'package:timeline_tile/timeline_tile.dart';

class Home extends StatefulWidget {
  Home({Key key, this.onClick}) : super(key: key);
  final VoidCallback onClick;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
int timeLineItem = 4;


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
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
        child: Column(
            children: <Widget>[
              Container
                (
                margin: EdgeInsets.only(top:20,bottom: 20,left: 10,right: 10),

                child: Row(
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
              ),


              Container(
                  decoration: new BoxDecoration(color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft:Radius.circular(30),topRight:Radius.circular(30)),
                      boxShadow: [BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5.0,
                      ),]
                    ),
                  child:Wrap(
                    children: <Widget>[
                      for (var i =0;i<timeLineItem;i++)
                        Container(
                          child:TimeLine("8:00","9:15",1,"https://www.roshd.ir/Portals/18/Images/jeld/ghoran3.jpg"),
                        )
                    ],
                  ),
                ),



   ],

 )






      ),
    );
  }
}
