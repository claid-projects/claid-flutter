import 'package:claidflutter/components/Chips.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class CardTimeLine extends StatelessWidget {
  int state;
  String url;
  String bookName;


  CardTimeLine(this.state,this.url,this.bookName);

  @override
Widget build(BuildContext context) {
  return   Container(
    height: 120.0,
    margin:   EdgeInsets.all(10.0),
    decoration:   BoxDecoration(borderRadius:   BorderRadius.all(  Radius.circular(10.0)),
        gradient:   LinearGradient(colors:[Colors.cyan[200],Colors.blue[500],],
            begin: Alignment.centerLeft, end: Alignment.centerRight, tileMode: TileMode.clamp)),
    child:   Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
          Padding(padding:   EdgeInsets.only(left: 10.0, right: 10.0),
            child:   CircleAvatar(radius: 35.0, backgroundImage: NetworkImage(url),)
        ),
          Expanded(child:   Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

              Text(bookName, style:   TextStyle(fontSize: 20.0, color: Colors.white70, fontWeight: FontWeight.bold),),
              SizedBox(height: 8.0,),
              Column(children: <Widget>[


                  Text('Popularity', style: TextStyle(fontSize: 10.0, color: Colors.white)),


                  Text('Like', style:   TextStyle(fontSize: 10.0, color: Colors.white)),



                  Text('Followed', style:   TextStyle(fontSize: 10.0, color: Colors.white)),

            ],)
          ],)),
          Padding(padding:   EdgeInsets.only(left: 8.0, right: 8.0),
            child:   Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlutterChips(1,"اتمام",Colors.green),

              ],))

      ],),
  );
}}