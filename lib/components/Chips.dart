


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FlutterChips extends StatefulWidget {

  FlutterChips(this.label,this.color,this.icon);

String label;
Color color;
IconData icon;

  @override
  _FlutterChipsState createState() => _FlutterChipsState();
}

class _FlutterChipsState extends State<FlutterChips> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[

       Chip(
          labelPadding: EdgeInsets.all(2.0),
          avatar: CircleAvatar(backgroundColor:Colors.white,child:Icon(widget.icon,size: 20,),
            ),
           label: Text(
    widget.label,
    style: TextStyle(
    color: Colors.white,fontSize: 10
    ),
    ),
    backgroundColor: widget.color,


    padding: EdgeInsets.all(6.0),
    ),


      ],
    );



  }
}