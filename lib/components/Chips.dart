


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FlutterChips extends StatefulWidget {

  FlutterChips(this.status,this.label,this.color);
int status;
String label;
Color color;

  @override
  _FlutterChipsState createState() => _FlutterChipsState();
}

class _FlutterChipsState extends State<FlutterChips> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        if (widget.status == 3)
       Chip(
          labelPadding: EdgeInsets.all(2.0),
          avatar: CircleAvatar(backgroundColor:Colors.white,child:Icon(Icons.done_all,size: 20,),
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
        if (widget.status == 2)
          Chip(
            labelPadding: EdgeInsets.all(2.0),
            avatar: CircleAvatar(backgroundColor:Colors.white,child:Icon(Icons.play_arrow,size: 20,),
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
        if (widget.status == 1)
          Chip(
            labelPadding: EdgeInsets.all(2.0),
            avatar: CircleAvatar(backgroundColor:Colors.white,child:Icon(Icons.access_time,size: 20,),
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