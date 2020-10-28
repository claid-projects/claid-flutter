import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class CardTimeLine extends StatelessWidget {
  int state;
  String url;

  CardTimeLine(this.state,this.url);

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
              Text('New York', style:   TextStyle(fontSize: 20.0, color: Colors.white70, fontWeight: FontWeight.bold),),
              SizedBox(height: 7.0,),
              Text('Sunny', style:   TextStyle(fontSize: 12.0, color: Colors.white70),),
              SizedBox(height: 8.0,),
              Row(children: <Widget>[
                Column(children: <Widget>[
                  Text('2342', style:   TextStyle(fontSize: 12.0, color: Colors.white)),
                  Text('Popularity', style: TextStyle(fontSize: 10.0, color: Colors.white)),
              ],),
                Column(children: <Widget>[
                  Text('2342', style:   TextStyle(fontSize: 12.0, color: Colors.white)),
                  Text('Like', style:   TextStyle(fontSize: 10.0, color: Colors.white)),
              ],),
                Column(children: <Widget>[
                  Text('2342', style:   TextStyle(fontSize: 12.0, color: Colors.white)),
                  Text('Followed', style:   TextStyle(fontSize: 10.0, color: Colors.white)),
              ],)
            ],)
          ],)),
          Padding(padding:   EdgeInsets.only(left: 8.0, right: 8.0),
            child:   Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                  Text('12°', style:   TextStyle(fontSize: 28.0, color: Colors.white70),),
                  Text('Ranking', style:   TextStyle(fontSize: 12.0, color: Colors.white70),),
              ],))

      ],),
  );
}}